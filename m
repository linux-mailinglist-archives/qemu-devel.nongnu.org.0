Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FADF426D64
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:19:35 +0200 (CEST)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYreo-0001Vz-9D
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrdR-0008EL-BR
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:18:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrdL-0006o8-90
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:18:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u18so30940329wrg.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UpvV80ndSdV8BQ5Q6N8QOlQvBkgQ1mtE3YFmLNfvWUg=;
 b=YPHvcZp1FMIHW5m2JjiFZzHVAzpcmks2U9reXh6WbOgYpZGBlPFsBdKYesSytOU7Et
 lgN1lFajJpFBkV2ln7zc2fLr+xfABjPmYMg/3EtaA9vkqYEicMShqO85N6FPsNr88FzC
 RuDyqReGgdDkYvZ5lyeSI5UpAjcP289TdAN/+RfLAZKDIVSIaN4ht0Jh+pfai84NZKFP
 CvbG5OQ7M9cHTxIoQkRkKoXoU9g92OSDlBinzlauGU8TqKQs06Sab4FY6gVdLYyyt80y
 RwfTqDnpOtGZGuhenCL6P9rmc/5nTS7cprvbgDuhtwgOQPwwF7IIiJHppJSml6EMG0tE
 bviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UpvV80ndSdV8BQ5Q6N8QOlQvBkgQ1mtE3YFmLNfvWUg=;
 b=30JxSxQt81rpeoDfOII1KsLy95LPUfqe6Qr4AUQujNDItHbqW5IcKeM5wCuxbR0M22
 dvJG/SSxkbQdlVho/jHL+XeiM8vH2hoaaELddTYJYU/2m6ySmJi3A1R66X8NJANJVWRY
 VjpPqJS8+ah8lptLINf4Kh5NDpdNzwCUPjstDBbg67FBgbVh7RhMpKSZ0QS651lJTUaJ
 CVpChw3zybuSUdJkrAop6KNtY6MT004A66MnctyeNHqbO2x2RVP40n5hTZ4iDoekCC8t
 QaAbSpeDxzmKFiOgW38/4a1R/z2hbYRCj/SZRLk/dsLG+bF3UxHKaQJM2Bd1TTcc3UDt
 En+Q==
X-Gm-Message-State: AOAM533DiNXFe2TuGOFTIi84kpxKRPlwsmdZUziDT2mUPEirGiYtHr4P
 uzPPDfb6PvuPEC+09TuND4cPwQ==
X-Google-Smtp-Source: ABdhPJzoE1hdjjvliOmKfR62i6FTkGRIsmuMr+ftaONxtVSahJk8HUAVApTlzyV/BAQNEAA/SxrBbA==
X-Received: by 2002:a05:600c:3b88:: with SMTP id
 n8mr4055223wms.93.1633706280785; 
 Fri, 08 Oct 2021 08:18:00 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r18sm2856379wrs.47.2021.10.08.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:18:00 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:17:37 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <YWBhEQxM4wRyZWzs@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005113719-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> Looks like this can not be applied yet because the bypass bit
> isn't in yet. what's up with that?

The boot-bypass bit isn't a hard dependency for this series, but it will
be needed for full support eventually. It will be delayed by spec and
Linux header changes

In the meantime we can work around the problem by having the boot disks
bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).

Thanks,
Jean

