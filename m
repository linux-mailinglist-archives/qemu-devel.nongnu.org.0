Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA02ADC47
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:43:10 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWjZ-0004aN-OV
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcWhZ-0003uh-At
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:41:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcWhV-0008FZ-Hp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605026456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEmb8A/ysHNeRGBu9Beb2fo8JA0figuwHCOoaplZ2Sg=;
 b=PHKoh0M8fOlg/x4g9qzQiHKbIPyvPsXEdaSFvioeUU3PAoJKrFrKEfIKrS882EUw+hXGzF
 q3k5LMQtXMoQBvPYAmS2TEFGRdNyih+wOzf+i9ddJQOcksW2Hoe6C+Zo2GeKP137ayaNhi
 bj0U7y6ZJ+I4hEK4eDGR0UcZEVGYquE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-mvO7OPjWOOyKTWHFWyUERQ-1; Tue, 10 Nov 2020 11:40:55 -0500
X-MC-Unique: mvO7OPjWOOyKTWHFWyUERQ-1
Received: by mail-ej1-f72.google.com with SMTP id 27so4889355ejy.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MEmb8A/ysHNeRGBu9Beb2fo8JA0figuwHCOoaplZ2Sg=;
 b=Em/o/1tnlVBBSDmec7zOzdxtlYBm1SEx834qnWVtja383xHH0X1rYli2G93RNXoOZy
 i96wgT5n4jD/HusqcOG8NfhuXuE4V8iSHbUqJ8ohVohHDtYs5bfpjcpiFEJIhHrT8qGX
 KApmWvdlB1NWl1UANM3DwBM2Ymtogdq70SALkTxnphEvnKnkq/0VocMcCZ+15AwC/RA9
 uYVnKYNQCnzQtc16ZWTm7lizUFT9prY7h7YarjOoBa7+bOE17K3p6YDiVv2l61E2dbMc
 nH9yTnonzgjS8D8f0BFiA3W/MoOZzeAnPEKPUDQvREeN1i3BUcQ9hWl2o+jTDO3Wnzpd
 vcpw==
X-Gm-Message-State: AOAM530ZaXHIV3ZxOQXY7gPHjUJCOKbkwKdzDO3TuDlh8DTqR2cgqh11
 UXyMNDuiBuVEdvEJ7P7sVb8njitcPctAbAwqvelE3K7WWBQGlzCPbFSMSd0alJ4JTSAlKJYBm+T
 UZ49s+YX2m2XFYRI=
X-Received: by 2002:a17:906:a4b:: with SMTP id
 x11mr21528325ejf.11.1605026453823; 
 Tue, 10 Nov 2020 08:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb1M6EzIFcBXlb4FJOKc3CdbbgxCSW9PUI3I1jkodrd98LdTGXtwY+53x4OyC2laa6kPa7xQ==
X-Received: by 2002:a17:906:a4b:: with SMTP id
 x11mr21528301ejf.11.1605026453629; 
 Tue, 10 Nov 2020 08:40:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c5sm11407327edx.58.2020.11.10.08.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 08:40:52 -0800 (PST)
Subject: Re: [RFC 0/2] Build a single Sphinx manual, not five
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201109214420.32131-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <22bf8b4e-ab55-3e3c-79b2-b46d4d00e212@redhat.com>
Date: Tue, 10 Nov 2020 17:40:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109214420.32131-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Maxim Cournoyer <maxim.cournoyer@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/20 22:44, Peter Maydell wrote:
> When we first converted our documentation to Sphinx, we split it into
> multiple manuals (system, interop, tools, etc), which are all built
> separately.  The primary driver for this was wanting to be able to
> avoid shipping the 'devel' manual to end-users.  However, this is
> working against the grain of the way Sphinx wants to be used and
> causes some annoyances:
>   * Cross-references between documents become much harder or
>     possibly impossible (currently we don't even try)
>   * There is no single index to the whole documentation
>   * Within one manual there's no links or table-of-contents info
>     that lets you easily navigate to the others
>   * The devel manual doesn't get published on the QEMU website
>     (it would be nice to able to refer to it there)
>   * Common information like the QEMU license, supported platforms,
>     and deprecation information either gets duplicated across manuals,
>     split between them, or shoved into the system manual as the
>     closest to a generic one
>      
> Merely hiding our developer documentation from end users seems like
> it's not enough benefit for these costs.
> 
> This RFC series switches over to building a single big manual,
> the same way that the readthedocs version builds it.

No objection here of course, even for 5.2.  The build system stuff seems 
okay too.

Paolo


