Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3F4D1F18
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 18:27:53 +0100 (CET)
Received: from localhost ([::1]:57606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRdcm-0002IJ-Cf
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 12:27:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRdKc-000832-L6
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:09:07 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=40805
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRdKb-0007Ie-2o
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:09:06 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id e186so39099080ybc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iMk5P7mrRqyOnS+aXp7NMtBVVrpi+SPcEQIAHFUzvzE=;
 b=oj/n4U8OIKGzy3LV8bx/2xoZ3Vi1pyp1UGudFDGkKxbQP4a7lFaLKDnuF7JW/3oY8S
 3XlArpcH3HIdXbgArkX3CYwZ4gDJ+thL0Zf1M3Bqe5d/bNWVTeOOJj6SLutHtK7rlO/o
 kzGFjTFsF+yfpZlq//fDfWaYejpuke3nQIacQEVcJET5r3rmyTD47FDqdQiWgz+akLME
 MZUzeCsg9eWC6jgTpE9FcUtIfSUl8FpEKeyDPN6BIW5U+f4og27jLiuAhSuxa9OdnbxS
 yQvk+G9Jt64WX8hcDPrAqQodFJiYxsVw4XNMWFZ4t8nBjbXYoGkoTtfhdUlo+BbJkzM+
 eMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iMk5P7mrRqyOnS+aXp7NMtBVVrpi+SPcEQIAHFUzvzE=;
 b=UTeA+rl9cLw/8j5U3z4Twihb4JEcU5osa8YvhAHzfKhmqOIzqGjAmbUrJ1WYTyDrwS
 8tqZlVaQ2ImkNOT21vqP0Opx2kt7vWaFp/BRMWzbBfMeNI82RcyfbLH+Qg1vO8kGiQ2I
 onX+eVEq+nUZ5h3+POj+RaUl295OCFRSMbuF85SQ+lnobgH+6RXo2ybFyHwXwHRJBkuH
 XTlAir/S/kxkHMbou61JKK2o3TeU/S5ojv0MyUo9qhNjc0uuw+eFfqsTCBZMkYBHizqU
 9SImJSPQmBuzz08Ik8UfCkYakV7sMRXV5Ev6Pvb7TwCP0d3aXEMxYUgTi+TUtkml9skz
 eM4Q==
X-Gm-Message-State: AOAM530dQ+6amUQTUUw/rq9azOftEMi03DRDZxqO+Z+UKQC4PgsN+8NZ
 mNYHN3yt/MKOE5+bLrTTz+4gPtU6GFLiKlZLSRXG/c5i5KVamg==
X-Google-Smtp-Source: ABdhPJyC+valf68lJSv6dZMOF/gJK0r/pkM8hH8GwepDB0IpmC7mABMGUrNI5fIVohaQwAFXaYvDR6oinYqAF3ysrYM=
X-Received: by 2002:a25:a08d:0:b0:62c:eed:e6c3 with SMTP id
 y13-20020a25a08d000000b0062c0eede6c3mr1697302ybh.67.1646759344027; Tue, 08
 Mar 2022 09:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 17:08:53 +0000
Message-ID: <CAFEAcA925HW-4tXetjXfS97VC3CKE+6tBWy7+19xprBr+OUyxw@mail.gmail.com>
Subject: Re: [PULL 00/18] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, 7 Mar 2022 at 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Last lot of target-arm stuff: cleanups, bug fixes; nothing major here.
>
> -- PMM
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220307
>
> for you to fetch changes up to 0942820408dc788560f6968e9b5f011803b846c2:
>
>   hw/arm/virt: Disable LPA2 for -machine virt-6.2 (2022-03-07 14:32:21 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * cleanups of qemu_oom_check() and qemu_memalign()
>  * target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits are non-zero
>  * target/arm/translate-neon: Simplify align field check for VLD3
>  * GICv3 ITS: add more trace events
>  * GICv3 ITS: implement 8-byte accesses properly
>  * GICv3: fix minor issues with some trace/log messages
>  * ui/cocoa: Use the standard about panel
>  * target/arm: Provide cpu property for controling FEAT_LPA2
>  * hw/arm/virt: Disable LPA2 for -machine virt-6.2


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

