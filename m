Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51136CBD1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:40:47 +0200 (CEST)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTZe-0003LV-O7
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTX8-00026u-BV
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:38:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTX6-0006Jb-QO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:38:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id q9so6463137wrs.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Cph1gXJGiMCINMajRg4bW4+fmtwZGqScAt8NUFCf+Y=;
 b=KeGe05KQjAvUAS94LBCS/zKLH38I8P8HJ4Nz4RJyVzjtRzVtP+ZfTIzCYGW4WgkJqN
 zcJEMJcSvzeX+RAidr+aGoCIFTIHy/AYPxVtGKt3ZgGBhtTcogibIysrc5TQGKVWl9K7
 4bfFhQJqnwsrPDb/bEh0VxU8mvRqAH7NB63waxwcbpn3sIMs5xe2BIyM7GrMm3lnoKi/
 9R9942BeS4su2PWZZDZGj/xlNSpNaKDQujHxl77ebkVvs//vsdIxyvQYRv8pKB81CXOt
 GmadIoKX+2q73vDJb0sbo3GaBv1k3avc/bXvh1/+SUQmrRe9jOXlqiPcWNW8kDj2b/0R
 jXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Cph1gXJGiMCINMajRg4bW4+fmtwZGqScAt8NUFCf+Y=;
 b=pY1AeKlxJFsWdhKR65RFCVIJiJ0y4YxmZ3CT9IZzy+Q/nvdyIEx8ACj56wal+rQGgO
 j1J/oXk/4R2OQ0NUyfuRC7bu46B17S8leXxdYIIZNDob6wLBb55Myt8ibreEIDEmLxR+
 pIu4JXEiwTS/BMV2Bj5mbJHJBMvMZWorXd2TUIHep2CCGl3Um8ffDBUBAqR+S5PewhFa
 h922M0+0YcPVvMYh7s1QPsz9eLLVqJ5pUqMMtsS0Iia+ygOsnCCyUseV1J5Ab/aSjz+v
 E+h2Cctrwszojv9yrtPZsl9vo7YDPZGh4z+Pe0HIjqxrHZTBRemcISTD9ngN/UcVQaxE
 4OCA==
X-Gm-Message-State: AOAM5316cFwYhE37nzXYdHxQ2ZzcjcdwF7DOomX1UpOWRSf43UTNlQmj
 eZC6CtTaiXp2Wjjxyqc829k=
X-Google-Smtp-Source: ABdhPJwQ2HEGYyrdrJ+rRBLKwZGGeON/igiU18mInD49eiKbwlgWvIEsUeluNpVPmMxfgKq4CPvceg==
X-Received: by 2002:adf:facf:: with SMTP id a15mr17043910wrs.53.1619552287024; 
 Tue, 27 Apr 2021 12:38:07 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o1sm5353855wrw.95.2021.04.27.12.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 12:38:06 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Migrate missing CPU fields
To: qemu-devel@nongnu.org
References: <20210423220044.3004195-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb51ae33-af42-8f98-90fc-77316e01bd0e@amsat.org>
Date: Tue, 27 Apr 2021 21:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423220044.3004195-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 12:00 AM, Philippe Mathieu-Daudé wrote:
> Add various missing fields to the CPU migration vmstate:
> 
> - CP0_VPControl & CP0_GlobalNumber      (01bc435b44b 2016-02-03)
> - CMGCRBase                             (c870e3f52ca 2016-03-15)
> - CP0_ErrCtl                            (0d74a222c27 2016-03-25)
> - MXU GPR[] & CR                        (eb5559f67dc 2018-10-18)
> - R5900 128-bit upper half              (a168a796e1c 2019-01-17)
> 
> This is a migration break.
> 
> Fixes: 01bc435b44b ("target-mips: implement R6 multi-threading")
> Fixes: c870e3f52ca ("target-mips: add CMGCRBase register")
> Fixes: 0d74a222c27 ("target-mips: make ITC Configuration Tags accessible to the CPU")
> Fixes: eb5559f67dc ("target/mips: Introduce MXU registers")
> Fixes: a168a796e1c ("target/mips: Introduce 32 R5900 multimedia registers")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/machine.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

Thanks, applied to mips-next.

