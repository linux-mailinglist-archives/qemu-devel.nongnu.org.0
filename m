Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCC1F1D75
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:35:50 +0200 (CEST)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKkX-0003tB-Go
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiKFa-0007m9-Ba
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:50 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jiKFZ-0008DY-1r
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:49 -0400
Received: by mail-wm1-x343.google.com with SMTP id l17so69630wmj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=OmJWc8VCIq1jsQ89oHTTLbByr8BtenyEgh0AApWjgr0=;
 b=RXKyblvsWQTZZaYChwoT2sJPM3CSDC1aWTpPkrEHM/od7EgoCb7YHYhPiiaE0oulZI
 MTrxWOKhkYjNAozV9MpVa3D4he2uk4HbN5Ba+LFvcbwoqaf8yp8tc3Xmje/C9CfDmRSR
 f1qW2xCVDQwtYA0I/eeQ1L4ZFqpjRSnhyROhOAaFpkGLQj18aIwhpjBBGCwIRYZ+FNel
 +rEqdqKG9JwhZxH7AupeXizJtZx7jmiT9IFfgJte2qB712bJIHlQ7z5QZdFpOkRnRLUl
 5J2LZSVJaoKE4tWogzgpHr6HTOArku1bjaofOv9GFKixGMcyfHotRc5O7z2EkUr/0yl2
 IK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=OmJWc8VCIq1jsQ89oHTTLbByr8BtenyEgh0AApWjgr0=;
 b=ky4AGVxrbLgKTTtPS0FjufO7KTV1m8cGcn+bBkO2L6QF+JsjszzbD1xrpc7vsC6wzh
 q4d43z0Jv5NuatnkhLeauRVe97HbpIWd2Oz0Xr+EpgM84+Pmlr283XW36CoAVSOZB60h
 hzLCA2VpcjEMXQybBXTw1CO0Q61v18JAE9qMyCSuZmOOAupmojYeRURZbxjb7ypujg4l
 TA6wfhogTBWTg+X1WgNLP0L1+ilbW5OyUjrOKpTeAeanpjWXuocXLPIX8Rk+xp6JiDr6
 GObZtCgtXjH5OaC6FyGP/Jg/6cwXJD3XJPn7EEhialKEAzcYWhsfVXdQ8B1P8HnGPz1u
 l0HA==
X-Gm-Message-State: AOAM532W8i6w/hElywtWZowDC5tWeA8gL8j4R0luYWxqkAZYh/+5V1d5
 DrJXGSSo9leJ5Cv+Eiu5gb+jNQ==
X-Google-Smtp-Source: ABdhPJwE+g/L+VbPEYnJ/UPLjdqmBmQKQisKT/FQnwdBQMQhpPEJAkc5SlntSwE+OJD9f0GRpLuReA==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr30763wmf.151.1591632226590;
 Mon, 08 Jun 2020 09:03:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u130sm15403wmg.32.2020.06.08.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 503021FF7E;
 Mon,  8 Jun 2020 16:58:00 +0100 (BST)
References: <20200515163029.12917-1-philmd@redhat.com>
User-agent: mu4e 1.5.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 0/5] tests: Remove unused bison/flex packages
In-reply-to: <20200515163029.12917-1-philmd@redhat.com>
Date: Mon, 08 Jun 2020 16:58:00 +0100
Message-ID: <87ftb55z3r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Li-Wen Hsu <lwhsu@freebsd.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> I was misguided by libdtc warnings, and thought bison/flex
> were required to build QEMU, so installed them in docker
> (and they also ended in the VM scripts).

Applied 1,2,4,5 to my PR. I think the gitlab changes already went it.

--=20
Alex Benn=C3=A9e

