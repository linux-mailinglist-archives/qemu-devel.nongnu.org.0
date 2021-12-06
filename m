Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E8469760
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:44:05 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEHk-00059A-2M
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muE1p-0001nz-DS; Mon, 06 Dec 2021 08:27:38 -0500
Received: from [2a00:1450:4864:20::32f] (port=42941
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muE1l-0005oH-V5; Mon, 06 Dec 2021 08:27:36 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so7598531wmd.1; 
 Mon, 06 Dec 2021 05:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dhvnfhOw1DIOre7gj/dDvjmKxgAH5FXqTb05qdLIFvQ=;
 b=LgUZIvsjvMkq52lNhk+BReTT/80UCotHtey1tE+GcA9/WEnsVv9tLRkG1NlVYL35vt
 Zsag37hIE0m1SamX/kZlgqd9HpLm784kLn7O8p/M/koZsI0lk5sxN4sbyrrrnbVa0sIk
 5motIGHjLtXazm24m6idflfHhRBP6wkPlWQ5NxO3CulVmLJRuZj7jAFSauzhTj7zCygX
 xmpmmM4PHfoy0863JsqaxYHGAnIu53jjeOp8luAEZ2A0MamB8j+FcDt/SnCzv4wQPUSz
 m9KCsYg3OP45XZNVXLI0DL9NLkirernoNVvOhHiW50NT3ouKzjw0QtH1naXXRvFqEhUl
 6Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dhvnfhOw1DIOre7gj/dDvjmKxgAH5FXqTb05qdLIFvQ=;
 b=Q5boofAgoD8B/LWNz+ua/5nSkSnLHQB+7XcF3Rm2Fsk7vhtdg2TwnJqX9QpyTtfb/4
 cSFYcFf6+xDk9Yr5QYGS8sEV2QXuLZYxT2CwLlGtv8+RF/ZnpDVeFZ0k/c/i39+7irCY
 uJJEp1C2f/5yldFs9e5WedGYll3mavXXelbx2OITpq1VvqoIqFllxSgbvtDEIjRgtQ7v
 /GzzZAMyDHFeOD7hsuRstMNycNX3JIksOFr9HT7uF+4I919yeYxxsR0OWBRxSOXhmQv1
 7j7bLdIRWC8WHTQ6CSHVN0yy5SKky2uJ7qN8UlVQ85RU2E4zcge22sNXAUYP3fq+zEtq
 Kr+A==
X-Gm-Message-State: AOAM5324ul/mgAPjIdmhadZrs/TwvA1Oe+V0rTukX98dRuH/buibaPlj
 DnMtwyiEGOYUjwJ8r60xh9Y=
X-Google-Smtp-Source: ABdhPJziPqmvpdGqLyC+nt/WSgZfz3NOS1Ou30RG3zn47DrarBCVpIp4cAG8sLzrvqRlOCtDBM5CJA==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr38731964wms.116.1638797252213; 
 Mon, 06 Dec 2021 05:27:32 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id p12sm13652880wrr.10.2021.12.06.05.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:27:31 -0800 (PST)
Message-ID: <370b0897-b87f-bcb8-ccaf-8212dbf8d23c@amsat.org>
Date: Mon, 6 Dec 2021 14:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/15] ppc/ppc405: Update U-Boot board information for
 hotfoot
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-16-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-16-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:37, Cédric Le Goater wrote:
> When support for the ESTeem 195E (PPC405EP) SBC (hotfoot) board was
> added to Linux, a different layout of U-Boot board information was
> introduced because the FW of these boards was an ancient U-Boot
> without dual ethernet support [1].
> 
> Change the QEMU PPC405 board information to match the hotfoot board
> and let the ref405ep machine boot from Linux directly. Only the CPU
> frequency is required.
> 
> This is brutal force. We could possibly add a machine option or a
> ref405ep machine class to update the board information accordingly.
> 
> A similar change would be required in U-Boot. The alternative is to
> change Linux.
> 
> [1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
> 
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/ppc405_uc.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index ec97b22bd019..649bb2b0daf5 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -41,6 +41,49 @@
>  #include "qapi/error.h"
>  #include "trace.h"
>  
> +/*
> + * Linux hotfoot board information based on a production bootloader
> + * (u-boot 1.2.0.x) plus changes not upstream.
> + *
> + * https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
> + */
> +struct linux_hotfoot_bd_info {
> +    long unsigned int          bi_memstart;          /*     0     4 */
> +    long unsigned int          bi_memsize;           /*     4     4 */
> +    long unsigned int          bi_flashstart;        /*     8     4 */
> +    long unsigned int          bi_flashsize;         /*    12     4 */
> +    long unsigned int          bi_flashoffset;       /*    16     4 */
> +    long unsigned int          bi_sramstart;         /*    20     4 */
> +    long unsigned int          bi_sramsize;          /*    24     4 */
> +    long unsigned int          bi_bootflags;         /*    28     4 */
> +    long unsigned int          bi_ip_addr;           /*    32     4 */
> +    unsigned char              bi_enetaddr[6];       /*    36     6 */
> +    unsigned char              bi_enet1addr[6];      /*    42     6 */
> +    short unsigned int         bi_ethspeed;          /*    48     2 */
> +    long unsigned int          bi_intfreq;           /*    52     4 */
> +    long unsigned int          bi_busfreq;           /*    56     4 */
> +    long unsigned int          bi_baudrate;          /*    60     4 */
> +    unsigned char              bi_s_version[4];      /*    64     4 */
> +    unsigned char              bi_r_version[32];     /*    68    32 */
> +    unsigned int               bi_procfreq;          /*   100     4 */
> +    unsigned int               bi_plb_busfreq;       /*   104     4 */
> +    unsigned int               bi_pci_busfreq;       /*   108     4 */
> +    unsigned char              bi_pci_enetaddr[6];   /*   112     6 */
> +    unsigned int               bi_pllouta_freq;      /*   120     4 */
> +    int                        bi_phynum[2];         /*   124     8 */
> +    int                        bi_phymode[2];        /*   132     8 */
> +    unsigned int               bi_opbfreq;           /*   140     4 */
> +    int                        bi_iic_fast[2];       /*   144     8 */
> +};

Why not use <stdint.h> types?

