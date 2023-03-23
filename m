Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E66C6978
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 14:27:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfKxe-0005z7-D0; Thu, 23 Mar 2023 09:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pfKxc-0005yj-8B
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:26:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pfKxa-0007LK-95
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 09:26:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o7so20494728wrg.5
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679577988;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rKET1aT3FbBnUdm/K9FEcjVZRNjwaUpj/1PJCNfW5XA=;
 b=Ji+IUlqR5wLNisxWvoXPX2JYZxwCrZqPfRcPspeqv1zrQle+46O+N0v/sQXLjTCY5U
 9fUpVfP4ebgHMGIf3yQwwwiXrpxbzNtKtd1sU9obxAYRuv9eHj0yXoHhiDldD79hDgr7
 3wTVErC33TWmR15dgrBvdGozeKEOKnkO22S3E6CcFWOtojsvorU6iQvT2EeDJ4qpLnhU
 6sjYCbZwq+DFsRV+ILsu2XayNJTTpqamy1UK5GQlVN6Q3Ah/yrWO4730XCVGbss0LC/J
 HmrZD0/vZHXbSGf92KmNysJr3qvM91AFE0HIRYFOUy50fBpfdxnmhY/RDgQbR+DHxT2C
 pxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577988;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKET1aT3FbBnUdm/K9FEcjVZRNjwaUpj/1PJCNfW5XA=;
 b=mgvR44YDWEIbkUzW0VAjpbiEYvI7nRZoP7/Zs4/NrQ1ROZvPYo+VWrzLd+tDqQdIn4
 gzrmaNhShaFRAtvZUxqRJ7T/o3GXII5VPNILyy6dNj6C0wDz622uzAV31Gzhj6j+lews
 iqiPd252uWo2CLGWl1w+FwFHHO4+AZn+65EuXxiXsoFto5TjZr7cpzvLlc1ZuDsHspga
 m4PZM/IOkp75bsExr1kXs4e7rLAQwkMJSXEdkA7zYOlWSIyOn1pvfDfdceArKVMp5jt+
 UShjpjcwpdaumgGsmpgK7SLP3+dne2ledq+lM8ipKR3T6E6bormUeoslViiU11VleDT+
 Dq4A==
X-Gm-Message-State: AAQBX9cmZ6l0sKf3CkUhMKe++xOxAUgCe3jsTUO49/57bcv5jLIICHR7
 /lERGlw+z/7uibDTypEgXIg=
X-Google-Smtp-Source: AKy350aee0JqiP1q0uzCYme5AlSYOtzrw8JV1YEAx8bdGDp75DOMnA8S1e5wMHCE35DI2Xy985uEgQ==
X-Received: by 2002:adf:fece:0:b0:2d1:481d:5863 with SMTP id
 q14-20020adffece000000b002d1481d5863mr2921691wrs.11.1679577988524; 
 Thu, 23 Mar 2023 06:26:28 -0700 (PDT)
Received: from [10.95.168.169] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffd08000000b002c592535839sm16164499wrr.17.2023.03.23.06.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 06:26:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f2f3ddbc-c39f-a0b9-3174-a95d5e391bdd@xen.org>
Date: Thu, 23 Mar 2023 13:26:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/xenpv: Initialize Xen backend operations
To: David Woodhouse <dwmw2@infradead.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 xen-devel@lists.xenproject.org, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-10-dwmw2@infradead.org>
 <209fe980-7f9d-4d79-90fb-12e38f12b2bc@perard>
 <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/03/2023 10:57, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> As the Xen backend operations were abstracted out into a function table to
> allow for internally emulated Xen support, we missed the xen_init_pv()
> code path which also needs to install the operations for the true Xen
> libraries. Add the missing call to setup_xen_backend_ops().
> 
> Fixes: b6cacfea0b38 ("hw/xen: Add evtchn operations to allow redirection to internal emulation")
> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xenpv/xen_machine_pv.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 2e759d0619..17cda5ec13 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -35,6 +35,8 @@ static void xen_init_pv(MachineState *machine)
>       DriveInfo *dinfo;
>       int i;
>   
> +    setup_xen_backend_ops();
> +
>       /* Initialize backend core & drivers */
>       xen_be_init();
>   


