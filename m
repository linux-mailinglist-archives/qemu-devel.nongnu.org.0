Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913718CC89
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 12:18:23 +0100 (CET)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFFfS-0007m1-Fq
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 07:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jFFeh-0007MF-83
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jFFef-0007Jd-Oi
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:17:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43430)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jFFef-0007J5-CW
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:17:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id b2so6908235wrj.10
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Rck1xqkMgJ1oDHV7CwXnUXzHnwrDzTqhP5w2GqRiHhk=;
 b=TcCjqjvCDb0d/5xD+xxbWcL6VnDZgNw8xR9TXUjLsw/4Snk8qPyXFA3eg1ky3CJvD4
 Ael3q+WhHWqxa0e/cGQ6fFYFtpVzEFgFvF8eiQssAchwyuk8ZqhEsfZlU8hHUjA1rl4l
 hb272aS8jQz9PEm9StQdeI7ERiOSaosUaaKvaNE27CfTPwHKXUJcIWhUsACRwhk3DyLx
 zNFAh9nvjGv8ySmmX4oBA4cs+HWxr6femvTJtXKbl7qq9BPqm3Md9bBORqyUoENsynVh
 aQRuqZPjrZ3KOuwkBRjaP7Rkb+xkVWpbn0ZWBNA+GJUQ7qDfoLJinRNwsF6Jt/uY83Rw
 3Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Rck1xqkMgJ1oDHV7CwXnUXzHnwrDzTqhP5w2GqRiHhk=;
 b=dVa2r1g8+UGOl1vI3jn8AqlaW1fnGd2+e4UaQVcLkPuygspggr2lFW4OEJ/w4qp2QN
 9Uj2R3fKN7toBNyYbYguvdaTNT6cOOJv88MIVmv2cfXXeQp4rqU4nJMA2HNcj7dS4IDi
 ggBXMPCyxy3gwACOW81ZTTbvLvXj0AzhkNVLXTs30sgIHm0lD18Z3ZaUAsmSp0vb5Tng
 KxynBRH6waqXl+X2VQydzHrevgCX1KX0CJs9cbhw6CF1uFLB8r6DgYKuSvbdAZziW+8w
 fCQeq5Div0RF+liB2oSCc+dsVs9BQpn+c0BDQRmd8x5sXYSOaIxqWIv7jjCdTIjEtX/P
 IYTw==
X-Gm-Message-State: ANhLgQ00Y3pug0dUCg1QjXgrkFkyGWmLvBjSgTpVJBvxNFSefCSny08R
 q9eQIJN9wQ/hUkNjleAkW8Wv5Q==
X-Google-Smtp-Source: ADFU+vuY3D/cD8xkXXDif3h6IQ5sJHTWpZOVwrVVGJjNt48Dwl5Kug1u3KFktlhTcgdlRn0J8SByew==
X-Received: by 2002:adf:e883:: with SMTP id d3mr10261511wrm.75.1584703051927; 
 Fri, 20 Mar 2020 04:17:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a186sm7391908wmh.33.2020.03.20.04.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 04:17:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EFE4D1FF7E;
 Fri, 20 Mar 2020 11:17:29 +0000 (GMT)
References: <CAPV47zcqvNekcUN=fKu1-dN=Sip3XR3+ohaG22-oNDm1dceJkQ@mail.gmail.com>
 <CAFEAcA_CeGozr3MUA6N=cMQVXLjoLD0ca-gywm+MLU4unfgwGg@mail.gmail.com>
 <39f82991-6d80-ba42-c7e8-4f6120a196ac@redhat.com>
 <CAPV47zfQKCaKS3BQ4+zbFJ1KyATqgOZvtaY9n-Gh_wtFCn4trQ@mail.gmail.com>
 <871rpojto4.fsf@linaro.org>
 <CAPV47zeQFEUhFmE6jgsehUUQKrYqjtqnfUfBdaKqaEy_e=fM=g@mail.gmail.com>
 <87lfnviez6.fsf@linaro.org>
 <CAPV47ze8XU6RceSrM9LUO58tdvP8mwShM4=_hee467n23eqn9w@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Priyamvad Acharya <priyamvad.agnisys@gmail.com>
Subject: Re: Qemu API documentation
In-reply-to: <CAPV47ze8XU6RceSrM9LUO58tdvP8mwShM4=_hee467n23eqn9w@mail.gmail.com>
Date: Fri, 20 Mar 2020 11:17:29 +0000
Message-ID: <87d097i8c6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Priyamvad Acharya <priyamvad.agnisys@gmail.com> writes:

> Thansk, I will check it out.
>
> To make my device I have used following link as reference
>
> https://devkail.wordpress.com/2014/12/16/emulation-of-des-encryption-devi=
ce-in-qemu/
>
> Also I have shared all the necessary files
> in previous mails involved in the development and testing process of devi=
ce.
>
> Please check the files and let me know if needed more details.

I'm sorry but I don't have time to dig through your email and re-assemble a
working tree.

If you want people to review your code you need to submit a proper patch
series which applies to the current master or provide a git branch that
can be checked out. The former is preferred as it's easier to review
patches with inline comments. You can tag the series as RFC if you want.

--=20
Alex Benn=C3=A9e

