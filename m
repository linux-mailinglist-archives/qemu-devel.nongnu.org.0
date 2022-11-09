Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808462281D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:11:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osi2c-0001Ay-1p; Wed, 09 Nov 2022 05:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osi2Y-0001Aa-LI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:10:38 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osi2X-0003bj-3K
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:10:38 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so1446433pjd.4
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tn+URKDFhLV5lcim97pXyJs0pFUBgUnky0TLNFsyy1s=;
 b=RneHEtERxwFI1lXQQ/HcMg0EbKbQ1XRE67dnnE+ifLO5E0C4bNNz/fV0WlTerBeZIg
 KEkGwvMVZO1SC0AW1oQHdS/B/yzgvZbb2kF4X1mbirtsrF7E/TLEAVTmM9xK5VWuUNcp
 WfKuICbbTn1QeqxcnLjx/jXgXz8CH0jve4Zzi2CbTct9CRxulznyywwSuWPFfA1FL7Bx
 Do/Xiu/kHz7WUE4nnzIvj3vzmj2uYLgBXwpCzvlAHXx8miPUCFMdiMJsyyRIoHJxeA4X
 dkPz6k1/5D0/ghcezAZmMeULs7Mae3TVKR73dKhoHT+E6RtXkepT7wrHgoIckdYDPVkO
 vvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tn+URKDFhLV5lcim97pXyJs0pFUBgUnky0TLNFsyy1s=;
 b=aZyay2zJddqjkXd1ssk8eAkkSCWtOEdXEqWFCFB5IoSpcrJ19ZTouzAFiSlqqBXCvt
 5ZohXmCL4dXRBHl594g7UMaJL8hHuZ12E/lI8pbeJUh3Cm8NHvDL3JlbrQPHv328ATjw
 mmyHvPup7oKdmY3bfk5VW8YkOtv1NG0qfr1VewVN545YATzWqWR9bTI6HEoo8TzkQizi
 FO9kufT3dzKoxV1tNVyGMBpa0oWYSkqAMk/7VB6tAkxUOfOI2OLFAKshp2kwmti5ah1r
 DqMrA3YeQ7rfoHei0xSm7Bf38J7Hr4KYLG9Cywy2NK/PlN4Y9JjN6BuLplMeu9zU/rqQ
 eWkg==
X-Gm-Message-State: ACrzQf3eTjVhAGDIucKhFZhmo5OyZRV0KYJUTrlNS6D0zuSiIeQZFpYf
 Se+q0/lF28H2KPuK/mbZ5F6H7NRs+OBhYUsI2CXIqgHMCqQ=
X-Google-Smtp-Source: AMsMyM7BxBSKuBpeomvEnG9m916cRVNSqiAaw124ZZRUv1B94W2r4O6JedntLcgGArZhCV5tkpngQs7AR+5WKLG05vg=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr61248625pjb.19.1667988635278; Wed, 09
 Nov 2022 02:10:35 -0800 (PST)
MIME-Version: 1.0
References: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
In-Reply-To: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 10:10:23 +0000
Message-ID: <CAFEAcA-gz1=4we6wNy3dyW8yTjpWUf2iERSMrHD55Pd=-xeeuw@mail.gmail.com>
Subject: Re: Questions about QEMU exception
To: "Li, Kevin" <cnkevin@amazon.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Wed, 9 Nov 2022 at 01:53, Li, Kevin <cnkevin@amazon.com> wrote:
>
> Hi qemu community,
>
>
>
> We are working on some open source project which uses qemu on mac, and we=
 have some signing process to sign qemu-system-x86_64.
>
> If qemu-system-x86_64 is not signed, we don=E2=80=99t see any problem, bu=
t after sign it, we got the following error:
>
>
>
> qemu-system-x86_64 -M none -netdev help]: stdout=3D\"Accelerators support=
ed in QEMU binary:\\ntcg\\nhax\\nhvf\\n\", stderr=3D\"qemu-system-x86_64: a=
llocate 1073741824 bytes for jit buffer: Invalid argument
>
>
>
> Does anyone has clue about what change may result in this failure?

You don't say which QEMU version you're using. Does it still happen
with the most recent release? Does it still happen if you build
from current head-of-git ?

PS: I think the QEMU build process should already be signing the executable=
,
so I'm not sure why you need to sign it again (see scripts/entitlement.sh).

thanks
-- PMM

