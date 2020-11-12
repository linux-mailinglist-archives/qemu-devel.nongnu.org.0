Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054D2B0CAB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:33:05 +0100 (CET)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHP6-0003bd-1a
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHMs-0002kh-4r
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:30:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHMq-0003i4-HC
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:30:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so7054107wrb.9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=hLwxuwz2pEi01F9gOwjMWlVfAaTQkuE2PmeU2OjgSmw=;
 b=VTriATFzVTTApwGzujJ/wG8KSi7TbHp4T1khvPh3dgm7ot83Ur0ygIzu1NBKgUez+6
 DNgu/7QgkM8AX0bx4I5w7HZ1Lfb2Bie40IFyYMHLvlEx1cW2u7AZyH7mg7LaC05Qzc3g
 v1Camnc1bw1pBODlsvfkZI7VTlzCO2XaaMLlkf6el/3xXi8703uq7HSqWkSpx9Gx4zbY
 x03Vdl5pvbVlD0w+LWTX0q+BQK7ROH8OK29spNhDvxNjBW51UeEB25xs/dpBtLp7zHlN
 DM24kWKVtPMkWNaofng1tH22zx2v3AQ2G0xJoefR8FnyA1yNXZPJod8fd4dtg7Mp6/Y9
 Xezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=hLwxuwz2pEi01F9gOwjMWlVfAaTQkuE2PmeU2OjgSmw=;
 b=dWNzQ86DBavwXFZOrcxdGXah3gnhh8oHfkMrBNSa9RFUwWcGX2NST1+X4FsOBhiuVd
 ulbcYhEBWDVzpAi+NvbvCc17Nu2ZyhMMdIoGEsg/mwX+GoiEoAiN6Yk5/Ob2TkoZuSsD
 lalzjZnmIt++dan5UgBHeqz3ot3nvc6sOZuMfNKapZnTj/qF8AsBsWsFCk6/fFIxOFub
 6UjAdblhVULPtSa+kRl/k8MfAGCHqvfK1d3YxcQJAdCfHqbA8OFv9bR+KX6fk+JnLFzs
 gdB8ZeaWkk3BcqOJRkFCGG+v+hVZXg+T7ZGfOt8bK7Y++OH6hGkLlaoPBsnf/CudbxCK
 4oSQ==
X-Gm-Message-State: AOAM5327QPBKdVhNVXviyT2EDuSD5foxmvnQSg0s5JmfUfkJ9MSVRbO8
 qZ+d6zjdH+LZZJDaU3yuCYySpg==
X-Google-Smtp-Source: ABdhPJwLNpnjm423cNKh3JurNTRQcVGH8lIAxQTB1oH8GYvH614CAZjywGo9KQAd9KigqDtUovq84A==
X-Received: by 2002:adf:eb08:: with SMTP id s8mr1068662wrn.12.1605205839482;
 Thu, 12 Nov 2020 10:30:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m21sm14833034wmi.3.2020.11.12.10.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:30:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C12381FF7E;
 Thu, 12 Nov 2020 18:30:37 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-7-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 6/9] docs: Move microvm.rst into the system manual
In-reply-to: <20201112144041.32278-7-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:30:37 +0000
Message-ID: <87sg9e5sxe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Now that target-i386.rst has a place to list documentation of
> machines other than the 'pc' machine, we have a place we can
> move the microvm documentation to.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

That said the x86 section runs straight into board models and I feel it
would be nice if we could persuade the x86 guys to write a bit of
pre-amble similar to what we have for Arm that explains the status of
KVM and TCG for x86 guests and the point of i440 and q35 models.

--=20
Alex Benn=C3=A9e

