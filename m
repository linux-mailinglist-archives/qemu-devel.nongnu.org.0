Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AA36B08E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:29:11 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxYE-0002dS-Dd
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1laxW0-000223-Hd
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:26:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1laxVy-0005Ug-Vg
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:26:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so555046wmn.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kndc5I0iWXxOC+OocBTTDWeDdAiM933JNAcSxmTLSsw=;
 b=CHVUofWsTeterJ2UW/GATgLQ/YHr14hblB/JLduDdJbIJQN1veSifZgfVBZ0ltreb3
 wLrTGhlc3CVerqtpUyzfZV4kpDNV5AHZvBkMef5EjxyMJhK/laXSjtUT0E3tTxQAhRz5
 9DcbICxGMerNZXGZlpxpeMumbYR/fWrWlDeJkBYJjcg1qIO65xOdqyIYcai7efadSgE3
 jNNbSuurDaBNCAMMsL7nMd9TXYJHecnt5RgT4MuphOJwjgmN2FCy+BikVIHpuOE5cVOw
 NfiodjO1N4N61GOtaBCuBuzbKvUM5NwRgTaO/9rM4yEeXmOIeiNslcDsitGLL289UT2j
 VFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kndc5I0iWXxOC+OocBTTDWeDdAiM933JNAcSxmTLSsw=;
 b=l2hc9xvhBK9GgbePyA8NLzjSaU4aOiVn57Ce4tZK9NlSW3E2ElGg7a2n8NzR7PbLlC
 Jt1Cwyqu6wuqQ5iQx7u+MTZiAoHJzVfmhykScXBvU8vxDdYVYQUYdXN02fruvJ/jqeHG
 YRHQjUNsWu8yuqLNpZj/hrJAF121gh46BOJjrNUP8FirI+RztyW6LDQvhMMlZyJ21a8b
 NT2bKk95OPYwHpJ6kctB82Z4IEkfAEIhRmy/goCmOsBMwtyswTu/JqXwwK+6lcfJIqIe
 ACCPtg7UdBJ65G03iNkSDaTg5r7eTM/N9lJP/6dvxMnLijlUx8KFlZqkgEkY0391/Iha
 IknQ==
X-Gm-Message-State: AOAM533Dc8xMIrNG5oDfOMxyk7Jf/136n1+ekxK2GkPJhWoe5U6x+JEd
 zYwr27MbMALWnq5dsaWl1Zh6ZQ==
X-Google-Smtp-Source: ABdhPJyfrfgu8Et12SKPMxSX1YBuhF2ItDrXXMb5gKzCmC80mvhrABBMQIYLzjyQ0QLbGzrfKokgqQ==
X-Received: by 2002:a1c:e345:: with SMTP id a66mr6180529wmh.109.1619429208490; 
 Mon, 26 Apr 2021 02:26:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v17sm8174033wrd.89.2021.04.26.02.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 02:26:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2F501FF7E;
 Mon, 26 Apr 2021 10:26:46 +0100 (BST)
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Windows Cirrus Build broken
Date: Mon, 26 Apr 2021 10:21:18 +0100
Message-ID: <87fszdtn03.fsf@linaro.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yonggang,

It looks like the Windows msys2 build has been broken a while on Cirrus:

Last working:

  https://cirrus-ci.com/task/6239849435889664

First broken:

  https://cirrus-ci.com/task/5344535250206720

History:

  https://cirrus-ci.com/github/qemu/qemu

While the green to red points the finger at Mark's qemu-sparc merge the
failure looks a lot more fundamental than that (can't find make).

Any chance you could have a look at what's going on?

--=20
Alex Benn=C3=A9e

