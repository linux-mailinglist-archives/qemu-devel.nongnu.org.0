Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3D4E2367
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:35:16 +0100 (CET)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWERX-0002S1-LS
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:35:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWEPd-0000zZ-4n
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWEPb-0007qU-5n
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647855194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cczl4ni1WymJeD5lYzx5IY18NVAHhgGFMkiZwrdHUIg=;
 b=ccK89BTpz3Jlfy4da6XnCf2HkxPcp9k/6CDfQgXpqokrmDaPGbWSYTUGcTJmdG9W+1iLuC
 +vbTu0TEBHdUS6zBKu9UPz6YVvSNGkd8BqK7mFlsircJ/gFrFBO0aR8ElgQDgGig9316h5
 AnqEdCptokQiuFpu8t/YUl2yQ5hFzIc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-9z0C4ykBPg6yFVBtF5Qw-Q-1; Mon, 21 Mar 2022 05:33:13 -0400
X-MC-Unique: 9z0C4ykBPg6yFVBtF5Qw-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so7080016wmr.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cczl4ni1WymJeD5lYzx5IY18NVAHhgGFMkiZwrdHUIg=;
 b=HtXvlu67C+V3GcTyc3ONNuMz83x8f7eYbcDuL/9JcSN/7AENqzYDyJc1CujftuHN+P
 yFY/3JeLNWZ46ktPLj3mPzzGtG6K1VF+0rZsAW5Zk+wCKIEJ25jU6BBPkbXK8Brjyn/Q
 Ay+WJU/pszhZ9RryXWqCNlfSlMiFSQmzWaL9KUB3LlD/rUzRIggxZImmR4vgsAYqiQ8x
 WtXopwsvTmYGFJbbEACtxERkqd4fMqqFAk/IGDKqS6diBE1F+TPeQcDR+AusBrjnrBTp
 1rjsjDca5NtnnVBmr7QI1Ey9li6d4K3cHgdajrapiiFWMQ4AfCaEXK9mg7q+W3HYRKRa
 Qe6Q==
X-Gm-Message-State: AOAM5327YhajsBvU+h6OfHI6+Lhef1i37H9pfO7IfB7h7KM/0mGXGbC7
 hbdxf0mMwDxZKR6l9Q4YlDXl3UMe4lSKaqa9ujV8MFd4LRCcDSufXB4n6ywhzzhV7Liaxt3FhCo
 M6gVFn+mcmw4P2Ww=
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr17277044wrb.270.1647855191940; 
 Mon, 21 Mar 2022 02:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ5yM9eKAROo17WAOpLJqeSkShvHn/cKnMiiTjt07SJC+O7gR+xPqfO9q2ZyxNjMOEv6xcUw==
X-Received: by 2002:adf:a302:0:b0:1ed:bf30:40e3 with SMTP id
 c2-20020adfa302000000b001edbf3040e3mr17277032wrb.270.1647855191755; 
 Mon, 21 Mar 2022 02:33:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adfec92000000b00203f04ed4a8sm9315128wrn.13.2022.03.21.02.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:33:11 -0700 (PDT)
Message-ID: <09077f75-60d1-be43-c075-a245c40be5a7@redhat.com>
Date: Mon, 21 Mar 2022 10:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 02/11] target/s390x: vxeh2: vector convert short/32b
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-3-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220308015358.188499-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220307020327.3003-2-dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


