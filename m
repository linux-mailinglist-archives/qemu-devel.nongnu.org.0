Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941C426CEE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 16:47:15 +0200 (CEST)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYr9W-00019R-Fp
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 10:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYr86-0000RI-GO
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:45:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYr82-0005Qn-JC
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:45:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r10so30611628wra.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=xMyiyUrIpGCfNww2oP0CI1qF5S6/Qf5RTNX3A85HAbi08Erhui8f0TaZ2MLd2tcqOm
 XVrAlyZBFnO/bFGJtAV7MBoxr1Ho8N23ZnH0HUKeYb9w6BVuvVOfojpkfwBMGE4jqAXO
 S32Hz+7TyEP5cE6IzgeR2M/Nx925D4JVfaPFZYAjkC64ZrpQnuzCFagYH6IPNTINMgI8
 pY3Y+sGQsHMluggWbrO4YI6xAQRXE75Q8YHA94RHaf6UnglakUuw78iCFj7mhc+Tt/dy
 NNnxiDj+AdnfJjg5p8p2L0pKjSzO3bPWo7upOO2hbJSja79X8V1PW5HFF3ARQ37224SO
 ZJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=OCi5H7oioZF7PkNcIWjA9o3ycx3qxVgNYWw22oxjn+E8QPIty180TzizB4YVo3k7U/
 7kHrMmOV/lZpM0qKbOq+zS90tyawXMbeV9T21NHOJuFbeXvteTECc02SqwP9RpX22GSe
 iNcPghvsa49IkWlLUP75MV7Xw+3RvouhZeDWnjZUkSvj1bd8/8AYnFKYL8qfki1DjhE4
 I+Scv8GvBxAakwC5JVM5Nw878YSTDHQrAbxad8f3NsX4rVw+iBqHNl1LVFbaq75sZq1C
 gf9UnKmLt4s3HDmStzTit8qPc84ntrdIHqbhjRd/Grd3kNcDZjzNWW/hLzH/N/58ChO/
 dngA==
X-Gm-Message-State: AOAM530t4QlCzCQ0pjwQDSd1rLY23RBqQ25Pl9SlTVqwygOeHhW2rWwJ
 lcQUyKCOCrhf1h8K/ikBCN+1Lg==
X-Google-Smtp-Source: ABdhPJzjTZLxxOwFDHW0Y0p6eIcUcJ6DoV0fQc7y8gnpzEzd9Wq5OIFj6Z5cAI6DH9AZEjzzKUy2Tg==
X-Received: by 2002:adf:bb81:: with SMTP id q1mr4652710wrg.119.1633704340912; 
 Fri, 08 Oct 2021 07:45:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm2736782wrg.60.2021.10.08.07.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:45:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40C771FF96;
 Fri,  8 Oct 2021 15:45:39 +0100 (BST)
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
 <20210810134844.166490-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/5] plugins/cache: freed heap-allocated mutexes
Date: Fri, 08 Oct 2021 15:45:34 +0100
In-reply-to: <20210810134844.166490-2-ma.mandourr@gmail.com>
Message-ID: <87a6jjd17w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

