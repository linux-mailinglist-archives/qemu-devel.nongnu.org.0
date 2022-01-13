Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951FF48D758
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 13:18:54 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7z49-0007eg-NN
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 07:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yiK-0007ez-Ad
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:56:20 -0500
Received: from [2a00:1450:4864:20::336] (port=53837
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yiF-0005Ej-8T
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:56:19 -0500
Received: by mail-wm1-x336.google.com with SMTP id l4so3666324wmq.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TfqO9cjuotnFcqmtgeGH//y4zStEcC8K0Ga9gnZxwf0=;
 b=wz38MtlDg7KAx8ntTsKuykFiDUHY2NB0Ko97+x5L5QmVO2fYt4loTE8OyNNC1Ryqdj
 4znvGhU4R6GMgJ+xFcYcB0pbfZuBR4MQ2y6jz7HuktqsSXmUEsfYUvbN6birKPzF8wOn
 UD8JahjuYtiwU9g9QLMynpj0EdKMU0/zwDPlLcVT3zG2b4l9EWCZCKnQOiPJcoG56kcZ
 bU/wXzXPgarOcU61uI2NPYG4QPcS6jud52A/34Zd5w45QB+zimyn2RVFRN2f7GZ9m5Gn
 7PUOefrRigu4KtDdP4R5HT3SI/lsEBFpQd+exo6XKaPwAioy910HxAbFMIMWd9qbi+Cd
 2TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfqO9cjuotnFcqmtgeGH//y4zStEcC8K0Ga9gnZxwf0=;
 b=5LFRBPbo1+AnP3V6CJlukHXMLHggEtFfy7VmZd0ZQdhc5nhMB9M5qno/5zwMiALvcT
 9mmXntr0YiRYqEDpSYjPZOmGhmixdR9L8jTJo8eDvBkMfR2yBPonzJeRbxzHOGBjy/4j
 m3CWztgZEz2ElDetL0f0+wrfg0/JAXhGZs88hGMhkMG1UphKeWUk7FyW0wWbO8m3u0rp
 v/5n/0fmZXcQ0SDJSQpdjUZAB8yznvTmib55X06rXT5EmAVYVNRnGW9jFSffAB3Bm5SO
 8o8sDUFap0sfyNN/S2hRxrKr4SObGSnSGZMalWeZYvSmULIyrjPTDPV356Ay7H3dvTHk
 jvCA==
X-Gm-Message-State: AOAM530BdjD0B71uw7ejGJQ6ptwZQpG0s5dDYNa2xFhRGMghTN645fBQ
 Nlp+bx/6tk+r0m0OkEoNLyVbnbDO4wPQnYimZvJg2w==
X-Google-Smtp-Source: ABdhPJxaNtSNbWBSIqSi8JFbgbvSp6aEIwEvC1B7Q3eb68k1Et/U3aRfVYzicvsxgrg0XHTJHwOQSifTAKP36htr4CE=
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr6900889wmg.126.1642074973990; 
 Thu, 13 Jan 2022 03:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20220111063329.74447-1-gshan@redhat.com>
In-Reply-To: <20220111063329.74447-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:56:03 +0000
Message-ID: <CAFEAcA962m6idGjaVf9+c2QHAK0zrqRFBoPXTdGJhD9qxKPY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 06:34, Gavin Shan <gshan@redhat.com> wrote:
>
> This series supports virtio-mem-pci device, by simply following the
> implementation on x86. The exception is the block size is 512MB on
> ARM64 instead of 128MB on x86, compatible with the memory section
> size in linux guest.
>
> The work was done by David Hildenbrand and then Jonathan Cameron. I'm
> taking the patch and putting more efforts, which is all about testing
> to me at current stage.



Applied to target-arm.next, thanks.

-- PMM

