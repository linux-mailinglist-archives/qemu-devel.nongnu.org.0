Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF12F16B4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:57:24 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxhD-0002jZ-H4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyxbl-0003gG-Rc
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kyxbk-0000Yg-4K
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610373103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMN4xdqcw0ckPYPE+EUZM6OWOnttqjuAtKGRPaQ0uZs=;
 b=OSPPkUuqOnBC3WmtqfP9+H4PpUqUwmYfWfCjQj81t5utZLaFKlVxI4sNTvOdToDftspmQL
 jBwiXos8GPGX/7km4S+cjhHTTyNaL4Ol7dXsTfZhG8ZHjBrg0zUVSMT+0i4n1AN5cdfz7B
 QSyU0CY+xMupq3Gi3Z2vfmkkH21y0kw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359--p0Up_gOMzSQh4WoY9ohkA-1; Mon, 11 Jan 2021 08:51:41 -0500
X-MC-Unique: -p0Up_gOMzSQh4WoY9ohkA-1
Received: by mail-ej1-f70.google.com with SMTP id gs3so5031323ejb.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LMN4xdqcw0ckPYPE+EUZM6OWOnttqjuAtKGRPaQ0uZs=;
 b=Ql6jO//ha0+2r/xauceTg9RcOPUA3u2ixfw4EpaMjaNX+vUDu4crsnjk/bNpDFXx2Z
 6KcXgkdyAVF5gQxKh0q5y0TiPdtRXMblQSskAiSvHwnaDgqszeEncpayoldROukv1YNE
 2hg90xL5f7vcJM5zAavSTtMM3/7JxW0M1qZY7ynfCbY3Iqq572ksJ/wQ+YcJD9Gpv2/c
 UmGuXnSuqk2Zj8B2+SoHROzjufVVkowvJzlO5hhW0ZwhrwadBRfYxlWYoCDp7Ed5HqWN
 kdKlXDiXUQAeE+813g+GN7VHPXU8gwsXXc7aAGSxlkYEVHmrirF4xJVjpwTDAhTmfB5f
 mPuA==
X-Gm-Message-State: AOAM531NIVg0j+1KOR6yMLKXIghu7Q2wu7sPh87dnJ0lhxSEsm5zQ5N8
 ddmOiCLrkxnsz5Cr3gYKl3+FZ+Lv/Ss8dzIns4PglfZIkfUFgHLEsfRm4kUmd7fvlHNrJfdTbdR
 OoMMyZ2vMveuUx38=
X-Received: by 2002:a17:906:e247:: with SMTP id
 gq7mr11365872ejb.27.1610373100146; 
 Mon, 11 Jan 2021 05:51:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMnuS1g6IAPi0UM2Ywg5wgEVN0eH4RF9bACbO9HMm6YkDuVUnX0Euu3pb9B+ugLODlxfEuKg==
X-Received: by 2002:a17:906:e247:: with SMTP id
 gq7mr11365862ejb.27.1610373099990; 
 Mon, 11 Jan 2021 05:51:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm7614616edr.65.2021.01.11.05.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 05:51:39 -0800 (PST)
Subject: Re: [PATCH 18/20] keyval: Use GString to accumulate value strings
To: Markus Armbruster <armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-19-armbru@redhat.com>
 <ee46bd65-e6bd-929b-74d1-1fb8110879c1@redhat.com>
 <87lfczk4ik.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd2c3808-59f2-7087-8681-6ba914890d8a@redhat.com>
Date: Mon, 11 Jan 2021 14:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87lfczk4ik.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/01/21 14:05, Markus Armbruster wrote:
> I had to choose between creating a conflict and holding back my series
> while we figure out what to do with your patch.  The dilemma is my own
> doing; your patch is waiting just for me.  I picked the conflict.
> 
> I can look into rebasing your patch on top of mine.

No need to.  My patch also removes the use of GString, so the code after 
my patch can be exactly the same.  Or in other words, squashing a revert 
in front of my patch just works.

Paolo


