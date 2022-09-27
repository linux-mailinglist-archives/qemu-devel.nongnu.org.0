Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6025A5EBF1A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:59:27 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7N8-00074c-Fz
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od6be-0007Ic-IR
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od6bb-0000Hl-5Z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664269817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e9V4mOxC7ZTYZ2NRPEsPcHZxTuIPyyP5Ra1HTlnicr0=;
 b=Dh2K3z4s17lRpS28t30Tt51mv62IVN42L6BUs1P2i4Fnu9bxCgBPGbX2omZ/OwyymFciRI
 zJAPRmgOYggw/R2v3kQZQFrdyvg+mXYIPJhHgNqhTZe3HB8pHLokOUTE8/ZGFxP81YO/n4
 fyRxn8VOYtxo9v5ae0rQk0GiiX+jDAE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-mJ1g9ZWvPPqovQ1tsQczFg-1; Tue, 27 Sep 2022 05:10:16 -0400
X-MC-Unique: mJ1g9ZWvPPqovQ1tsQczFg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-127fb6a5017so3358817fac.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e9V4mOxC7ZTYZ2NRPEsPcHZxTuIPyyP5Ra1HTlnicr0=;
 b=StTTsGga01BbBVXn50CtB8UlFbyxFE+Log/XUfogG0AGRm45v6Iqk8cu8+IECHvyQL
 hso4qSey9BrUt+UMg4hU5VYlynNXXfouIZnRyXlSDjho+/jpPMypw9sy2CYs7u2icVab
 MgeG2whyBK43rErieAg7Do6sLKnlr7kTK++zbX9tTwpvM2ue5vZNc5V6/Nc0LfcAOvqj
 9B/10zsmHb8AcnLnvIXvsBrdrXx6+EiySkmk03LCOscUIGz/qlcJW4VhMOVSqqnyiqxk
 3/3qw4ERcqPzc+jsQmvy5qO9Ks/ej38aphcTwyJABfjxW7VoZXaFa0nUXB9rt2lvgmdM
 PaiQ==
X-Gm-Message-State: ACrzQf0admsRnjK5SBES3Qw0lxZfDMEjDJ1dLJzB5CteuVxFuSxtC3W/
 xEH3z96092dbliJT1hdLb2lPRHONOWjVskl7MrZuZWvl5O5s4uLzvr4hFexQ2uSheciylaUmvLw
 WOQQAshcWis/7wXsBiYwF6rSbWs6RLKw=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr11974035otu.378.1664269815790; 
 Tue, 27 Sep 2022 02:10:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cEz0rnXNRNU51kR4DX5EADmZvjLRlQppSViZZKNiF2kbxfDUbGMIG0fQ2+zjNRPO4nAPUjOntiUOykZgL/CE=
X-Received: by 2002:a9d:125:0:b0:655:ced1:254b with SMTP id
 34-20020a9d0125000000b00655ced1254bmr11974028otu.378.1664269815525; Tue, 27
 Sep 2022 02:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220926110746.2769518-1-stefanb@linux.ibm.com>
In-Reply-To: <20220926110746.2769518-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 13:10:04 +0400
Message-ID: <CAMxuvax8sJVS=F_LaLYzBbf2DOEUWcxRTQKTy9qd=6v8oFrF9A@mail.gmail.com>
Subject: Re: [PATCH] docs: Add --tpm2 option to swtpm command line
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Sep 26, 2022 at 3:39 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Add the --tpm2 option to the swtpm command line to run a TPM 2.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  docs/specs/tpm.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 3be190343a..243e24b692 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -304,6 +304,7 @@ a socket interface. They do not need to be run as root.
>    mkdir /tmp/mytpm1
>    swtpm socket --tpmstate dir=/tmp/mytpm1 \
>      --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
> +    --tpm2 \
>      --log level=20

Why only there? The next paragraphs shows usage of TIS device and
dmesg logs of 1.2 TPM.

>
>  Command line to start QEMU with the TPM emulator device communicating
> --
> 2.37.2
>


