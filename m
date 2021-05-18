Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90685387475
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:57:17 +0200 (CEST)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livXQ-0002wD-Kd
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1livWT-0002C3-59
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1livWQ-0006nx-Nf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhxlbNpZiSRsUx2FpflPjDF4kbkgXsyBAh4UKJZqAjg=;
 b=gsEGE4aobewhP3w1XFy/NrDp6iebn19bYY1oeHky1mUj0MERSTXCZZsuvLm9/Wp8RLTB6x
 5EqEJPgR0MsNg+R9MSBXOtmodaTxXNrTxSainJ6aHt/Yo9734xnILzjt7SCXLpstgdhoP/
 Yum9GmVILoE9G+YtLQiH2hqEJYH7gK0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-a0BzeRk7OyOZwphWUda5PA-1; Tue, 18 May 2021 04:56:12 -0400
X-MC-Unique: a0BzeRk7OyOZwphWUda5PA-1
Received: by mail-ed1-f72.google.com with SMTP id
 cy15-20020a0564021c8fb029038d26976787so3951567edb.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vhxlbNpZiSRsUx2FpflPjDF4kbkgXsyBAh4UKJZqAjg=;
 b=AFOIK6HzIGc2Q+DWoe31O7sRLjM/2vIBnSAlKnUl/upNE4hPFvtFLz+oxcnE2ZIf6s
 RHcin2ka8mINTOT0ga/Bx6W//TehON2adcRlXAeONU+kbV5+PG6MwBYSx3CHWt1hicv2
 Gq/5Y1Nkgc+Mn25bjthd9MZdBKShtW+my7qcdLtF0IOkoLqBLo1wJ8V+H9B3ddGzCP/E
 Mx9tloR34GvhWW/R1CW2wNGDq5VVdGWRP9Wev5PzefkPF3PCx4S8ei3IZ4Cxw3luInwp
 vSOeaoRdgCFwrPNFbOwOvU3shxled5uo2Tt0JEfJTXtdfTDb5pQHOsI5RHJQTaP6vVGz
 dzrA==
X-Gm-Message-State: AOAM532KLxrVkQQY+6q93HwIiY/Nq7SWT/x9lwnubCY98Jhtv7tguJRV
 RmIq2XU5GscQuKa+kNAkskJTkpq3fwnUeXoKkNT3HB8emKwGfoJ3DBS2w2DvCIVCF376poN/WO5
 rmBZxwNOG7NopTxo=
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr4947225ejc.459.1621328171052; 
 Tue, 18 May 2021 01:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzssvxqJ0HCqIuLBXP3sT+Ax2QEBKrpO84ye1bcn+Kj4aJOa/+hgqWkc6VcqoaK17uC9F8nIA==
X-Received: by 2002:a17:906:1444:: with SMTP id
 q4mr4947207ejc.459.1621328170874; 
 Tue, 18 May 2021 01:56:10 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id ch30sm12723958edb.92.2021.05.18.01.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 01:56:10 -0700 (PDT)
Subject: Re: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is
 enough
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea6cd344-95f0-7e8a-f02e-ac210b6ef940@redhat.com>
Date: Tue, 18 May 2021 10:56:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518084139.97957-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:41 AM, Paolo Bonzini wrote:
> I could not reconstruct the origin of the $(($(nproc) + 1)) idiom,

I guess it is the historical way make would aggressively use
the most compute power it could? Then later this bad habit impact
was reduced by the -l option to keep make under some system load
value.

> but I suspect it was there only to have a sensible result when nproc
> or getconf do not exist.  This can be achieved also with an "||".
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

BTW more candidates:

.gitlab-ci.d/edk2.yml:49: - export JOBS=$(($(getconf _NPROCESSORS_ONLN)
+ 1))
.gitlab-ci.d/opensbi.yml:52: - export JOBS=$(($(getconf
_NPROCESSORS_ONLN) + 1))
.travis.yml:93:  - export JOBS=3

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


