Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F251D56C4C1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jul 2022 02:25:34 +0200 (CEST)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9yHt-000712-E8
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 20:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o9yFK-0006KK-LU
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 20:22:54 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81]:55373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o9yFI-0004w2-Co
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 20:22:54 -0400
X-IronPort-RemoteIP: 209.85.166.70
X-IronPort-MID: 211250530
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RUWMPqpTaHpSCj+o9TkwK7xnmM5eBmKTZxIvgKrLsJaIsI4StFCzt
 garIBmGP/6CMDanKYpxOYvlp0IAuceAn4RnSVZk/C02EC5A95acVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHvymYAL9EngZqTVMEU/Nsjo+3b9j6mJUqYLhWVnV5
 oui+5G31GKNgFaYDEpFs8pvlzsy5JweiBtA1rDpTakW1LN2vyB94KM3fMldHVOhKmVnNrfSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/HKbhNq/0Te3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYcDYvAIjrlugkUQhFNjxOY5RbypncPi3q2SCT5xWun3rExvxvCAQ3OtRd9LkvR25J8
 vMcJXYGaRXra+CemurqDLkxwJ19co+0ZOvzuVk5pd3dJf8iUZbPWY3A+JlV0CpYasVmR6+HP
 ZdBNGE3BPjGSxloBlwvBplvoMel2VfEbR4FigqYv6VitgA/yyQ0itABKuH9Y9GPWIBZk1iVo
 krA+GL2BAxcM8aQoQdp6Vqpj+7L2CL8AcccS+X++fltj1megGcUDXX6SGeGnBVwsWbmM/o3F
 qDe0nNGQXQanKBzcuTAYg==
IronPort-HdrOrdr: A9a23:wRKRZq9Eh+Ocs95LUVhuk+DBI+orL9Y04lQ7vn2ZLiYlEfBw9v
 rPoB1173TJYVoqMk3I+urgBEDjexzhHPdOiOEs1NGZMTUO01HHEGgN1+ff/wE=
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jul 2022 20:22:46 -0400
Received: by mail-io1-f70.google.com with SMTP id
 k1-20020a5d8741000000b00678ad1103e7so216706iol.21
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+5SLBsDzkP+5zYo9F0kzfTnD2ouZwmVjOb9PxbbPICQ=;
 b=oCG9Dk0TDyoGEEHsPPrlgLKA6LmlB4wgqgTUDLT1QlGx1rbWHFeQ5yqlhNtt/wre4B
 OhuK6FCYxjb3X9EcPLiFrqr++LsXypeeecIfi1HH7CKNXlnCi4oeHsZuX4hnHDPxQQd4
 6RAgONlWWKGY1qbOBDWrzV4yJla40/mtMYoXdTOpuZBAdnJDhWowTBXKM+Mv6St2APAV
 5rn7c5RDJrHaTGcbYPgprBJim9f8SPHd0WadfQmVBMLibb5WxnQ2ZRs4O88J0WhzLgoa
 RvZ9umTqSuNAuw5jmQUrhUmXYIMt7Mq5g9tdCP57r4gus8kk8n/WrZqxSEQy09eFJoK9
 2OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+5SLBsDzkP+5zYo9F0kzfTnD2ouZwmVjOb9PxbbPICQ=;
 b=2K2kk/gV6wrMxZmFGaZ0bbWXaSAWosCemfIHgV/MxGbhFD2+O9pVAXxrwLk14yG4me
 noU1MLdBtJg7C5P/Dx/cwNOrNRr3YbBlODltyykl029gbkPo7rW65eMjcy8q4RtQNbic
 S1czzD5kWD4KKqywQ2UZp9ml4S+Rmhd6dYHWUPdUqcy+dlPoKrP/XnUSCurBrO6dHHXh
 pm6D98BuWpoHxB4gxfgPO6pwL+XNFme+X1rRjw4bj53zwc12RPMwxYk39YXFkYbPOfwx
 mhsp3SfuvNWURzXtHNIgXxVm/r57Y3+jLVh5+1KA6EJlETUnFNKExDQqLYoSqGzyXDsm
 W7ew==
X-Gm-Message-State: AJIora9xmOUTNgbelKQlJ5hDLOuecoJMjg5ncKlgET/EUiPpyCj0uI9F
 xlwgfdpUAWl5f+HYC6hXSW4GZeQd2UxbMZbTdCas6hqPOgJbsoBdWHxnSyn9XOWag2yP5jRW8PG
 Z7PYBXx7gx2vJz/4mzjRRp8D4wQ5JYg==
X-Received: by 2002:a92:c26d:0:b0:2dc:3f21:28fc with SMTP id
 h13-20020a92c26d000000b002dc3f2128fcmr3574894ild.242.1657326166295; 
 Fri, 08 Jul 2022 17:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sow4C65jeKVhMQesOyuH0Bt5siOvK4APJy/3aJqw9iqujFGXRLNhlG3C2ZeK6c2KHb4cxF8A==
X-Received: by 2002:a92:c26d:0:b0:2dc:3f21:28fc with SMTP id
 h13-20020a92c26d000000b002dc3f2128fcmr3574883ild.242.1657326166016; 
 Fri, 08 Jul 2022 17:22:46 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a056638381500b0032ec5c47c17sm33052jav.46.2022.07.08.17.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 17:22:45 -0700 (PDT)
Date: Fri, 8 Jul 2022 20:22:41 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 thuth@redhat.com
Subject: Re: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Message-ID: <20220709002241.222q4rphpim4lf74@mozz.bu.edu>
References: <20220705200543.2366809-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705200543.2366809-1-mcascell@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220705 2205, Mauro Matteo Cascella wrote:
> Set current_req->req to NULL to prevent reusing a free'd buffer in case of
> repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.
> 
> Fixes: CVE-2022-0216
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/scsi/lsi53c895a.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index c8773f73f7..99ea42d49b 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
>          case 0x0d:
>              /* The ABORT TAG message clears the current I/O process only. */
>              trace_lsi_do_msgout_abort(current_tag);
> -            if (current_req) {
> +            if (current_req && current_req->req) {
>                  scsi_req_cancel(current_req->req);
> +                current_req->req = NULL;
>              }
>              lsi_disconnect(s);
>              break;
> -- 
> 2.35.3
> 
>

Hi Mauro,
https://gitlab.com/qemu-project/qemu/-/issues/972#note_1019851430
This reproducer crashes, with this patch applied. Maybe it is some
different bug though - I'm not sure.

With -trace lsi*

lsi_reg_write Write reg DSP1 0x2d = 0x00
lsi_reg_write Write reg DSP2 0x2e = 0x40
lsi_reg_write Write reg DSP3 0x2f = 0x36
lsi_execute_script SCRIPTS dsp=0x364001d0 opcode 0x58000008 arg 0x0
lsi_execute_script_io_set Set ATN
lsi_execute_script SCRIPTS dsp=0x364001d8 opcode 0x26010000 arg 0x5a41ae0d
lsi_do_msgout MSG out len=65536
lsi_do_msgout_busdevicereset MSG: BUS DEVICE RESET tag=0x0
lsi_do_msgout_select Select LUN 0
lsi_do_msgout_abort MSG: ABORT TAG tag=0x0

In busdevicereset, there are also scsi_req_cancel calls. Do they need
similar changes?

-Alex

