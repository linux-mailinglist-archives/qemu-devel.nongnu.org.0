Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F43687AFE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:59:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXJB-00038I-QI; Thu, 02 Feb 2023 05:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXJ9-00037j-SQ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:59:11 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXJ8-00068y-9F
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:59:11 -0500
Received: by mail-pf1-x433.google.com with SMTP id w20so902144pfn.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5MPAzlnkq4jieXj+AZ5oyvAVmkHd1aMru4y2/TiUiw=;
 b=MCYqduTcfx4fThiZO51zWgZ/9lQ8+ylwn4vu8pn2fkN17C77Mms4ioPrZUjtFaxZI1
 5yhyWF359IQqxNa8rM+gXbgBw4zVQSwwCIdCxn9/qF1GKfj1+4SBEkPvvn/DmObEeqWg
 mdxaI+V2FwIe8bjGUSA/xd7mHyG9ujSqVJNBae8HLbz5QKYRkDBGqHow9o9DNUHvVGwN
 csozcWOT+WRw8X1/lXLxSBWNXgqTHKbehcJXbQZDrIf3BvmgBBEeUSoNb7C+1qJt27dj
 OPA+3/T448/AqMhNxMbCEnueWf0lp9U5ZzTOvzrVYGq06vIFR6nwnNMacXMV4Vixt3Uc
 1HTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O5MPAzlnkq4jieXj+AZ5oyvAVmkHd1aMru4y2/TiUiw=;
 b=7+vPD02DAaNHwJqY5rkTYZQSL7uufcu7qOxpQ0JCxJjRRx7eB0YUJzVMEtvmAiWFGW
 8WZrP5ZKShwBNFxXr9K6eeH9IOmvTe0Zw6/o68r9gSyVXWAHhzjw7IyBKRNzUzXqS2jJ
 SL2QwwPbv0RW3QyFsunmhftFpmxeI5EiIykusOS8EGz/0095fsh29z9U4AcL4y2eCX5p
 4eHf5lnG33A9qHPJ/e2hzUudIoi51c3vcrqsVTCkUxmC5t9ueKLvdO/H/GeEd4DhF/vS
 QnlHEkEOyDE/aG2ac7Sb9MWCt5Tj+zLKqlFa+fbJLu2lFcF/W3ls0DTcUcqsO3mBfWfI
 xIjw==
X-Gm-Message-State: AO0yUKWDeeMw5WnyGkIuLAWIXX7AhsL2TDrxmEFlriyGcdZ2OYRUtA7t
 iqwbFCXP6VfA/rg3s8RiVcPleE7H8pYnBSqEDd6wEA==
X-Google-Smtp-Source: AK7set9VbykLJq0tJp7iIWUsnXwSPaJZTj+zG87jIhbfKg95TtX6QeFSckvTcBb5Sb8WTjaVDqa2nrkgfR2hSgvQsc0=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr1376095pfu.23.1675335548823; Thu, 02
 Feb 2023 02:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20200703165405.17672-1-peter.maydell@linaro.org>
 <20200703165405.17672-9-peter.maydell@linaro.org>
 <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
In-Reply-To: <7592c27c-0c98-d52c-fecc-ac2b261ecbb3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 10:58:57 +0000
Message-ID: <CAFEAcA8AXsXa7adhhmvMrh+kBoQx=tJ9PzizAnrgb=Db_vupGw@mail.gmail.com>
Subject: Re: [PULL 08/34] hw/arm/virt: Let the virtio-iommu bypass MSIs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 10:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
> Where is "len-reserved-regions" declared?

  DEFINE_PROP_ARRAY("reserved-regions", ...)

does this. For an array property "foo" the machinery creates an integer
property "foo-len", which must be set first. Setting that
then creates properties "foo[0]", "foo[1]", ... which can be set.

thanks
-- PMM

