Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10AA3B17FE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:18:02 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzxJ-00074W-GP
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvzwQ-0006No-A5
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:17:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvzwO-0002ru-7N
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:17:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so2017430wrv.2
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=V/dqzKPMBUOHpe8jfh9SgaTmxGTSiJAXD33fRcSZd0g=;
 b=BFXeD2O7ZhRECC6FFxawM1o8i1We77a1C+jjy4r+7t/CIpTgGfLvh8p4xHYXYEsQ0A
 pLbPZ3uHCo7y2t6UQN/AWiDnd1yrLKRURxz7bSBmLBSF0lspBjeUVFlmRwlv8jurnCIb
 spgCGpRv9uJEk1GnBxNLeovfi4WME6r4NULltksVqiZsDlMS+5sMJ46K/+/zYIxuMqWt
 sAWFaj7VT6/qOjcojDQI3sG4z40N1YLOvEJ/LeGWLpRGnga77s+bMSDP0Rs+QqFYm+SZ
 PuFbTa28pos3q0OvFNXRL175Hff6ZOhOLSwD7IP6Et0zZOVBW9vzSXUU9rcsPNQxpCgv
 87lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=V/dqzKPMBUOHpe8jfh9SgaTmxGTSiJAXD33fRcSZd0g=;
 b=sC0JqZTvq4jIcEGFJwUdFxchSG+3eNjMhZQSd3D+JzXDzkkarOl0RGBTdiiLq/a5Ws
 ebtfcO+vxWO+FYq7Ga9Q9d8WSrBgR4fXua8uQlkTsPCq+ChR17LxKC/TcKSvrUgEJNlz
 pfVnRFYJbdb6EKkaKjrZWNOF1xCTzvAqv5X6FSs8lu71GQfhL+94ansHvJZ6Ix2rFq65
 EUY1yk1sdqorRztcDp4XFwDEDmM+QOTr/Lu3cbt6bSeKIJS0KDhLdSvk9kYpis7sF+Ce
 H9a0q1NJIlSuEMjPCQrHAgSxop55F8xRRdSemtgCcCaPWrY8la71Dxjrty8MdXZivfVh
 Jd9A==
X-Gm-Message-State: AOAM532yoo3KReL6tT0GEiJ2Jw6i2OGYYnlGysWnW89UpC1mitdc8Tr5
 VFeJlbC+KRVpQnSERNV9sELFBg==
X-Google-Smtp-Source: ABdhPJyfKTPxgYLGXOwQ0gYlAVXhu1RNNdKflB2SQdPjulc6IF/MEgQTHmI48k7Jf0veiaQ97GtEyg==
X-Received: by 2002:a05:6000:246:: with SMTP id
 m6mr8056634wrz.116.1624443422566; 
 Wed, 23 Jun 2021 03:17:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j188sm5330554wmb.34.2021.06.23.03.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:17:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A9E01FF7E;
 Wed, 23 Jun 2021 11:17:00 +0100 (BST)
References: <20210619154253.553446-1-sw@weilnetz.de>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] Update documentation to refer to new location for issues
Date: Wed, 23 Jun 2021 11:16:36 +0100
In-reply-to: <20210619154253.553446-1-sw@weilnetz.de>
Message-ID: <87h7hosx5v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Queued to testing/next as I'm putting together a PR, thanks.

--=20
Alex Benn=C3=A9e

