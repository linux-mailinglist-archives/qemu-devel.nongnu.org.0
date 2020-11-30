Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5012C81F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:18:20 +0100 (CET)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgGA-0000Le-Vc
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kjgEf-0008JA-ED; Mon, 30 Nov 2020 05:16:45 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kjgEd-0000YC-U8; Mon, 30 Nov 2020 05:16:45 -0500
Received: by mail-il1-x144.google.com with SMTP id b8so10676388ila.13;
 Mon, 30 Nov 2020 02:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GD+Q+hopBkNKUgk/dBOUlrM7vLxBr+IZ8V6AC3zD5YA=;
 b=Dg1tn+iWH0M3dMDOS58I8VDJJU9Vk0OaM9k5LDzT/CNtpSJeOYL5gxIv8l1gPBlzhh
 CRMh5kIuyfO8Jh5peq6I4q4yu5a2xjVvERJv2FmrKft0BzqR9FS3bHyqilwhgR3q3Dvc
 FpKDg+qBPJFhLKeHCprqttaWcFfDtO0UJSklPtKHeTvZmqKkJvVDtGsdd/Rup2GUrPIH
 /9ibdRfaS/FFewEH35IflrAhvrd2y3dKkgx1rCzwb7tBL63TVISeJwShWKDGGxTFbhm+
 +FzgvbDORAapY0nuwB9OdqYnJTHX/OeUFYheHBlvmqF8hD++7w5zC0qXho5+Un0UTAYM
 ht6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GD+Q+hopBkNKUgk/dBOUlrM7vLxBr+IZ8V6AC3zD5YA=;
 b=H+PpxKODMi/Q18xwGG17kWX3lAE3iBd3CFtHQTRIHiN9syAB8CsUzXBOAsxRjGRadb
 jV5o+at7F2w++CmxS/8i+IFeU3jRMdQjHniZJ+sDkindQZK970DpVe8cHtEMckJkinVw
 tOM7thKwzd7uwxrJPA8tnc52keCZEae/bxh7jKsvu/K0ne74u5fz0QEzAwKczgjjJgXz
 N3nzS3aON4b5IDbvAZs+h1tZAIv7/XsVA3wX/GaicFB402YCDu2Jic4Sp1tbznRj0f4f
 l66Hqh91t5O54nEMmFkbGHFkVBiAg77VnPqviS5kCEB2Y0atQqJVMw2v1FmxycwmvYAV
 tIIA==
X-Gm-Message-State: AOAM530bF3tvoH3m11GL8pkjZVEWqsxlb7CvEDXHMjFtfp6ElVpDfO3g
 ZawyOhNRcaP9NiayqHRJBdabGHZGBIawHC/XDn0=
X-Google-Smtp-Source: ABdhPJxsoHMLW+RfdaAcZuSCrhLQ+EMVQNsNqHPP2o9ViloYoX/lhMzD1SROEbBegSQudLBxpGPa4GTo9y6UwHfuWwU=
X-Received: by 2002:a92:b510:: with SMTP id f16mr6868182ile.22.1606731401519; 
 Mon, 30 Nov 2020 02:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-5-ganqixin@huawei.com>
In-Reply-To: <20201130083630.2520597-5-ganqixin@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 30 Nov 2020 11:16:30 +0100
Message-ID: <CAM9Jb+ivQCcO9LZUpPnfUXG180+G2NXUNZyCTVQXgsHscChazQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] nvdimm: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>,
 kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The category of the nvdimm device is not set, put it into the 'storage'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> ---
>  hw/mem/nvdimm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index e1574bc07c..e30695b2ce 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -236,6 +236,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
>
>      nvc->read_label_data = nvdimm_read_label_data;
>      nvc->write_label_data = nvdimm_write_label_data;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>
>  static TypeInfo nvdimm_info = {

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

