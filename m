Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C683EA331
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:56:41 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8O8-0006O3-AY
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mE8NG-0005h6-Aa
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:55:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mE8NE-000238-Ry
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:55:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id f10so1040258wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NAEUbJA/XQbOehGBFm3+ttdw65Lt6iRzkZ50l7YwxhQ=;
 b=wxEXJvlf1Lhn003WXN6mcOQXP2uu/dFzHC9rtBL0m6IG92rr5iQIRk1Ux5Z0KYpe+5
 +zz9O2TYnkkQ1ePBwKIBJGD1r3UnJChNQIxGrJnVvZyKnvzYSYY7cksdqEtqaSSxkFvx
 7tpEBGknEhmocwgkBYGuUl8CluSuKPZawWpJKZ3Nm7XuqM7eUnPT3tiCT18uINhWW1L0
 wSVCaEwnygY10ihKNddDMx2dCFQuKUvEPuEGixqTLaZYl+wwXVWkHTOsopktLprpbd/i
 T/8kPg9f7s/SdWPXbcsJqyGJ56Wc+q1wjmK3odru8cBZdVW0d1r407Wkz31sd0cevkWC
 Cu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NAEUbJA/XQbOehGBFm3+ttdw65Lt6iRzkZ50l7YwxhQ=;
 b=kidkGhsevBVAzjTG0n+muNLTkfR7C8o503p0Wx2uqevNSWvo+bqtpsEaDr8eb59PcM
 FwqTUjPwlWxKG/Y0mVNCOB3Ev86YSujCY3FibJhncWggKbPk3bMfUQ6aUwlhjPq9dD9j
 WIq0yuPsfAoxY7HwySEhVRo1cwuaYFUbhCU9UUkhoI82iIeQdbyPBznzTELIYw1rmKBX
 +bF2a1iNT/ttYsUlXY5bXbJ+WL03yUlKxt3WDr349lVSscaNuMQ/ZAtZuF80YlVRCjEw
 T9M/YxmURqaLnH9Q7vhF32i5OL+sxievq6B3pH4hG7ZkhB6s6VYUZFDkKLsGVpJU09xI
 OYDA==
X-Gm-Message-State: AOAM5328WIOeQnbKIMTSQLJhiDbdj376vmJ/o/SkGe9JD01oa1RXXr2G
 HrmiQu4YIpBRft/QZL4PBRVNew==
X-Google-Smtp-Source: ABdhPJwJ0AgDjgpvTMKaime0Zb1A08ihyujwMgH0i7SD35457gyNA2BgNPAPiP5iJzRtmVmhoWQstw==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr3318031wmb.47.1628765742760; 
 Thu, 12 Aug 2021 03:55:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm2551963wrv.84.2021.08.12.03.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:55:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 889D31FF96;
 Thu, 12 Aug 2021 11:55:40 +0100 (BST)
References: <20210809164559.66638-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v3] blog: add a post for the new TCG cache modelling plugin
Date: Thu, 12 Aug 2021 11:55:34 +0100
In-reply-to: <20210809164559.66638-1-ma.mandourr@gmail.com>
Message-ID: <8735rf6ifn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This post introduces the new TCG plugin `cache` that's used for cache
> modelling. This plugin is a part of my GSoC 2021 participation.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

