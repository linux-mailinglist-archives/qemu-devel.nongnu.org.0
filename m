Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5037922C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:12:06 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7Zl-0001Ph-WD
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg7YE-00081X-9Q
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:10:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg7YC-0001qb-IQ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:10:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so17015926wrr.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=KF+Y67CHwziG9gmlLcq+a/I9IthDalJBqNb5ThLFzSHxaOppPkVCWlpJWf/43boLUk
 l5wPMvgT9loebji+vc0RKVdl9ayqUWMwUJ3/IJCnMm/Uyx4Iyv8gIQ5xBpnoQHu0ccaG
 U8aSizKs9CHP1oxPxAMHzVCknaHxsTxDoLLcV1bYHsg/IWg43cqlxEXXsKOVwJoN5uR1
 pDXRhE/ic8/+ad/ORnnQDxqxANn437A0ZXND+nYGLHsrS122zXbP+Z63IHc8X11BolYt
 VIPUzMXUuEyZYZZ4OtkESlQEqxpRi4OwbZSgDQL/oxFDJXiDn8MoF7RFlIaNqeENOLNT
 W90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=U52m1XbmAmFv3FSWBpD5y7B3unHqyW+7I/uOGTTAfX8zcaqhmVEFbd2nbBKU9sbXgZ
 PCtp25DMoAAEQA8HTj8Mj9JUHHhdga2JKKZ41wnOHyTMjp9RW7iZwHooFAXJ54NewUIO
 w4MEYPBVeAAD2bmfknZ3NsfZpo1LZIHdN1wFVx5s9hm1xoMfjJFxiFMovZYmUZq9KWpV
 qYeRSelUdqqV6TuuxmLzfHgaFvqdW1tLnm35D6jyNwSmO6Q19GsUz2zjAE+gQ9oArYtA
 m/yc2gEfwz/TBhEbaVIAg/u7j4+wf9RJn7musF6ia4Ozqh5yh/UoqF5015wAploo4b//
 sAdw==
X-Gm-Message-State: AOAM531osCtvzCjhpah3A19sk6ODg61xei8JZdjEULEsPSnDIkjIzE1j
 xGySJvpMPMK44EWyfWK6bHVrtg==
X-Google-Smtp-Source: ABdhPJyqc1JEGD86K02HC6q0tSr9lMgKzo7jx7HhXTiYkofgFB22xg7f5o6m0mDZf/kyHrIfcIff4w==
X-Received: by 2002:adf:ee83:: with SMTP id b3mr30667545wro.329.1620659426894; 
 Mon, 10 May 2021 08:10:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm24905207wmj.7.2021.05.10.08.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:10:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 574701FF7E;
 Mon, 10 May 2021 16:10:25 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 11/72] softfloat: Use return_nan in float_to_float
Date: Mon, 10 May 2021 16:10:21 +0100
In-reply-to: <20210508014802.892561-12-richard.henderson@linaro.org>
Message-ID: <878s4my68u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

