Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6653DD459
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:54:58 +0200 (CEST)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAVay-0007vu-W0
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAVZB-0005uN-7N
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:53:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAVZ9-00017h-QL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:53:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id m12so16158790wru.12
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 03:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fKkZw5PBIR2mxQ5WPOa3HS3XESH+qjnQI8BMJdgBXXI=;
 b=KjYgDppfNviBVC8DeJ6FHllWbtdYsoXA07qXPpSA4QP6pijHULyVnRkwb1/r9E8xOv
 BqROybDtZQcldXrQdprkWntXfMRQytKLTXZmDVpWaAgC23e6slWnY/DtRLEavHwrcLEx
 tZppwS0Ey/F5hzgyoDJ+EVrRYaRnuqJvHWH/OHLtfz2Y6AxsX2Opx/VCXu+cKlMSiDZz
 LH1Upwee0u/IoBS6ykQTPD1tt1q0OpH2juB9csLetieTpEChYFkMaOa0xi1Sr7+gzNjt
 sL84+lKEUr2XtIud+ezQChSVyRx6DZaw90X33dX4pVEpVB1q+9qowwS93zbZmvQyxRA6
 +4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fKkZw5PBIR2mxQ5WPOa3HS3XESH+qjnQI8BMJdgBXXI=;
 b=Raq7ra+SONTeH5ufqFXZv+JB3VrFNHlUpChpRb4P4vcjWAZ/WbDK5xb+lAxnDbJg8z
 E/7yrEFD8qxSrqeMDHcxWPVXvSohYZul4idLYrQUIJfpa6vmRACwcyL+YQl5lADRT5Wz
 ObHSzqYwiZhd0GDl2KHtLdaqxfXxJ10UzOYrkRz2ng1B2KjWz9Lnw+1UgPrdcQdfrve7
 ya+dUYgmWBzhcbuRK/YP8kBmR88j3w8CuhaucFx9gENwaO9fP5SZ7+7L5NB6sskATYR9
 CtRKALerwJGJ3al6zkNtN0pbpXDBz56Y7YeTsdyXu1v22N5GY+iiJhOzU4pFbavBsnUw
 AzYw==
X-Gm-Message-State: AOAM531gMT+9xKlVYtezMqYqkE2mvn0TWvcHEg/wvm02Z6uPVCsPKtcy
 +aVTi/IoXldWg71/4B64CZ1enA==
X-Google-Smtp-Source: ABdhPJxQGwW/kugRtjr+RsJXqcQTMorVS4OxNlZt4RAlK0oRAYZZRZPNgFk4WZKEGbKR1+Y4tJZpYQ==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr17090235wri.168.1627901582288; 
 Mon, 02 Aug 2021 03:53:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b20sm7447329wmj.20.2021.08.02.03.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 03:53:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDF1E1FF96;
 Mon,  2 Aug 2021 11:53:00 +0100 (BST)
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
 <20210730135817.17816-7-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 06/13] plugins/hwprofile: adapt to the new plugin
 arguments scheme
Date: Mon, 02 Aug 2021 11:52:19 +0100
In-reply-to: <20210730135817.17816-7-ma.mandourr@gmail.com>
Message-ID: <87k0l4gltf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Parsing boolean arguments correctly (e.g. pattern=3Don or source=3Dfalse).
> Introduced a new "track" argument that takes a [read|write] value. This
> substitutes passing read or write to "arg=3D" that is deprecated.
>
> Also, matches are now taken one by one through the "match" argument.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

