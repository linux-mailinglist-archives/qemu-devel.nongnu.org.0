Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D33350758
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 21:25:13 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRgSm-0006jS-8y
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 15:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRgRW-0005q9-AW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 15:23:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRgRT-0007LL-N8
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 15:23:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c8so20745688wrq.11
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Jjsu2T5Ch9Hj/AM5VF45QIPFjmOU56i/te38N8WfG9g=;
 b=MkX2MOA35MKbY9Qo/d4o8e+ySHpDOxQp7Wh/bILdmMtveWDG2CiKDaCWHTwRjtlK56
 gpgCbDtwYmGH8pGLKSsmqzFQT5QEf/PuomoGTlGIYnb0L9ZX5NAXAFvpUT41pUwPdxKG
 vRn92IW4QFUWTDboHAbAmfx8eiMNGF96DUSTal6qz+FUgB143hi6HkZwGENHmOaqWtwP
 3+bXmSy7S1S5/EED6GyY890WVljdBz5+pIn2So5PbnKlU9kqRtgKZjQyqzuXWIuF45so
 7qHuvxWgg1IpHkKGlE46yAj9OK/19zp/hcu/F+YY4u9tqb0J9z0gJCDXBBiYB3RwWYy4
 geag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Jjsu2T5Ch9Hj/AM5VF45QIPFjmOU56i/te38N8WfG9g=;
 b=Xft9Jxdcb8ImrKDWFP6Tsr+btvQPO8YfdUW++ZmsJoNlgC9UzFNs0swz/1Skm1ONJf
 xdtx6ejvVJXkOm4iQtR3AiiO+zUlie4W/KD75L6cLVWzUL1wia9nuFW6ghwRVWVxcFWX
 MO8s6rP8OF2ws/TGWPCm73yOjRM5IigmlMp8VNY9pR+exHtlCYg+zD2SgldwMV76rQzC
 7Oc8HUYDyuewqNfguzQ4ci2h/1oQW48XyuGOoMiHrJNTOomRhruL6Ggd3Ku+X09k5eNP
 PzWY3wLquZGhbOkd2yP6f0eJtiRCMdHY3prrYX9yZVCt/UD57aPB465+wW0qWgERzTZA
 yjVQ==
X-Gm-Message-State: AOAM532z8/viiUtcoyJ/5UdV7E1cj1bJBX/SgMrvRmNMzBnJh/T1C/FT
 potYgmEMZeaPZQz5usr/AZDPCA==
X-Google-Smtp-Source: ABdhPJwugi0nDSg9X2TIwksUxhcd2BX78MMuY8pFhGWU+/idhYlmynW2+v085Zx9iBz5gUCI/1TVow==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr5383973wrj.224.1617218629864; 
 Wed, 31 Mar 2021 12:23:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 64sm5133992wmz.7.2021.03.31.12.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 12:23:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B2661FF7E;
 Wed, 31 Mar 2021 20:23:48 +0100 (BST)
References: <20210331160351.3071279-1-thuth@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Test the dtrace backend in one of the jobs
Date: Wed, 31 Mar 2021 20:23:42 +0100
In-reply-to: <20210331160351.3071279-1-thuth@redhat.com>
Message-ID: <878s63nn3v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> We are using the dtrace backend in downstream RHEL, so testing this
> in the CentOS 8 task seems to be a good fit.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to for-6.0/fixes-for-rc2, thanks.

--=20
Alex Benn=C3=A9e

