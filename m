Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E304A8332
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:33:34 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFaMm-000749-5p
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFaKt-0005l4-BL
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:31:35 -0500
Received: from [2a00:1450:4864:20::435] (port=36771
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFaKq-0007kc-Bc
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:31:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id u15so4451361wrt.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5vY/OfNeXV6qkYQ0GOjDYDny9N+iKJUzGJsq6bSnxpg=;
 b=I5lrvhA6jqNWrDG1Kd4iefGdV+26dl36e5MpFYv+tzkr3RDcY79r7+WqhWIGbe3RK1
 +6sX+8rKW6oHJwL+CwkyVfXsVPiPqDH3g57KkZ0QmtPKBVy40G819Qaiq47cZmDsHz3T
 lMGSd7Y9Q3rJaYu5w0XW+5hQUksW2uhT4G+4Byf404IaFZ4Im+QumAGK9vqIBzpWf6jC
 v302wf+7qUYb/9JUIJpnyIDraagXZP8/hoOrVviMdQpEg2Db6F0LQGbDU/cr83hsZxyu
 9AFosjI3SzFdy44uUXij44ruGoFOUftU1lfdloGQ6mA+aBswA9YU6WwIb6ExSMTTgWLV
 0eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5vY/OfNeXV6qkYQ0GOjDYDny9N+iKJUzGJsq6bSnxpg=;
 b=vEuLnqfGOkdZCgzQamm+HGmr2Ay3GzHJTgAz0nYgI8Dbp4M1bCfeU0gR7/1wah4JlK
 +dzuRn7Q0wC7KTe/9T/5T5eHI5usqFEXBoqeoLeX+Jx+k6JHAFBF4zKdGwgv5soHfFu1
 G/4JwLdLVg+7Pkfl4jrgEJiRqRC4YGfEahb+0af6bRIC3s8qkxBX5ATYold9SkIuRrP2
 /FOgJWP79DxDmBMaytFtZyk6mAAL1X1erbTVGknpbFe7rclIOotl0TJuS+UeCZ7hFgZX
 DsGPzu9FCSTXYqwO3sH0Ith28agVfURQI5feQ9l333k6t16nx/40T//GndXtai1ckboX
 iY2Q==
X-Gm-Message-State: AOAM531zk/uvVqEhO27AgaZrdxaep/rCoEszkmODdMZ2f7Gho6ScV+sO
 5efJOtDblyOogpEwYrmKE9UhRjI6aQNrvpVnv1RIQg==
X-Google-Smtp-Source: ABdhPJyMC81GbsrXYsf4PwyaVNTyRWso3Eoq8VCj2AVvGVzg1PApiCms4WCP6gLJZblQPiTZ3D2eR+3s/rAu/WKvSkU=
X-Received: by 2002:a5d:5343:: with SMTP id t3mr29734851wrv.521.1643887890565; 
 Thu, 03 Feb 2022 03:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20220127063428.30212-1-richard.henderson@linaro.org>
In-Reply-To: <20220127063428.30212-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 11:31:19 +0000
Message-ID: <CAFEAcA9QNd+Jjprkxrt9rzX3QnP_CmnTURevT27uykjKdW=VxQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: SVE fixes versus VHE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: yuzenghui@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 06:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fix two problems described in
>
> https://lore.kernel.org/qemu-devel/6cdfd5de-2465-adca-73b3-9c66945cf18a@huawei.com/
>
> with some other minor code cleanup.
>


Applied to target-arm.next, thanks.

-- PMM

