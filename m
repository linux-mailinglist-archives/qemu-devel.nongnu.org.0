Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDA490B1A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:07:03 +0100 (CET)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tb4-0002aw-7V
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ShY-00038w-7K
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:09:41 -0500
Received: from [2607:f8b0:4864:20::430] (port=38685
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ShW-0000t0-Ig
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:09:39 -0500
Received: by mail-pf1-x430.google.com with SMTP id a5so10298696pfo.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RzLVX5iuxz5LrmPqzSwYx7iAa1h4BRsTfPAP3w2ficU=;
 b=A042oNbyYiQcVN78F3BjsvuEDBsu3q0NMOAzVkpUJ4+4c66KZZmHRZWvjrM/UIMST6
 O2mjKaDMdltd+t0rQIQWm/+W0SlGSubVcVd2KFCV+KJTz/8B+GS2WC/daMNlh6n1eBwb
 EofvubLzXRW2AlXL5cUR7ad94N5JCOWr3xH6XK1NLwI5yabfVduFrtBkIaKjMy5gNPDQ
 bHCtkRCjAuSZAfdRj/FPhS4AzAUkQFYDo5Ft4f99K4tlmbis///q/zy8QNk/xcsZ8tNt
 rp7fJzVHiZwCd556hfrV6UxcivUjJASwxh479iazH8snYHDsc/0Tfz4mdbpuFFACHgwh
 48/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RzLVX5iuxz5LrmPqzSwYx7iAa1h4BRsTfPAP3w2ficU=;
 b=Dnheo34AP/Rek5RoAa+7KGT7mtic2OJPaNnolOTDEYT7r3n/etlQWb2o38DZubCEfW
 04l29ONEnpzbYVmju2vg30d3xSWpSjzOLhY9PXC5AOaFjL65UVat583fLh0IsJwuMLSh
 GDxcPjTnwN+hWwAxSNRRZgWPOezXMCjMeIy2d7D0Up8ZACyWKbaQIlkC2wZuGBB+9hkB
 skjvrs50jIoIKEfSThJHYAzk9CgG3LM+f/aiQZtpdmOuB+xYuhCVQlsAXB4WhBxw9+gO
 1bc+/UmJyr2sEIbUU/hAErCO0tgYGGCl1zMgWX2umNnuodavGE+KJI3c7t40n4F2s3pZ
 z0kg==
X-Gm-Message-State: AOAM530pPz/Nbhqha+zeVPKYgeR4QPfspEztG9KgHHPZI7mJwId5k0ds
 a/DlevXI+G3+apjUxG2mNYDos50JVmkuC30J
X-Google-Smtp-Source: ABdhPJwg2G/FO/j6zXax5rGJgifY2ptbjGbSmm34m6BEWm2xzmUNzNRKplCBvnvdl6P0KCTGQZkfdA==
X-Received: by 2002:a17:902:8601:b0:149:ee23:890a with SMTP id
 f1-20020a170902860100b00149ee23890amr22148785plo.12.1642428190364; 
 Mon, 17 Jan 2022 06:03:10 -0800 (PST)
Received: from [192.168.125.175] (41.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.41])
 by smtp.gmail.com with ESMTPSA id f7sm14856771pfc.206.2022.01.17.06.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:03:09 -0800 (PST)
Message-ID: <37a251a7-b6bc-ac80-8c2f-02a03f4fab26@amsat.org>
Date: Mon, 17 Jan 2022 15:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: 9p root fs HOWTO
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
References: <2785520.nJZE4KsnAZ@silver>
In-Reply-To: <2785520.nJZE4KsnAZ@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 17/1/22 14:14, Christian Schoenebeck wrote:
> As I was still reading claims on the net that 9p was not usable for more
> complex use cases, I decided to write a complete HOWTO for installing and
> configuring an entire guest OS (with Debian 11 "Bullseye" as example) on top
> of 9p being guest's root fs:
> 
> https://wiki.qemu.org/Documentation/9p_root_fs

Thanks for doing this!

Doesn't it deserve its entry in the sphinx-generated manual,
rather than the wiki?

Regards,

Phil.

