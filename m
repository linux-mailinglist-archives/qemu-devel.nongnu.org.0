Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE8F30AC4E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:09:49 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bls-0006zl-Tt
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bip-0004Rn-Dy
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:06:39 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bin-0007P6-TZ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:06:39 -0500
Received: by mail-qt1-x82a.google.com with SMTP id c1so12620864qtc.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kO5BdTtbX1LhxK7BNKtOZY26vFRCnQUfUq6XqSh8d1E=;
 b=hnXI7KuD+Pfu5Xe9eEK702JW7ljlRnCkJhLbDN6OiesrrUZtW/gd43mYsAZI+UolrT
 /Si9r+MNxnjhevr+hxu67JuNxC7aUEdzR6fX2iyOKmuBrFJ9Fv7e8dFCPb9BNSSThnod
 wgjJtD3IakgOE6bWtUOeSPF0JkKsEbFXEfcAGwaFZh5UsQjkpnOn1yawRazUcGknHNUc
 9i6x0Q2Fmnrmr9HssjQZs6g/7Sr4cqNmfJFDEwSO2gk/lqowrW/5crfdw7DizezLkJ71
 ZAoWbuUWiB8bRVaF3IAryCkrQBFKUnyofW0iCk4rsT/i+vO+fWsU+LPEbSHLyFsdsQZM
 7Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kO5BdTtbX1LhxK7BNKtOZY26vFRCnQUfUq6XqSh8d1E=;
 b=phduf+ZLjTtGwKxzLDkeD+dmlRhZZxXmutreByc8vee9PjovbjJcD/tUgG818ABji7
 5/kiMDPOUfYLWh/kC8daLtvxYyFv2LX49fAqad/1gmkvV0j7pAZc9HANipeSEI6cTAOU
 CT+XShLGC96bNxblN4YEPe2Ao5v15zPbV72Vtill/OC4vN/XHwApXdb01GdE6jSack9R
 l0/UxsolNt4PF51Fd1dlkiK/xvKGCrAMDk7ANwPMj5QOuwhkOvXRROn28iXpUaxaYJmz
 lS42v5VRjJ3sdBqNp5P5eH9zxRc90pQlCLaA/GsaZvEppC+TRBtb0dl1odBjWBL6XWoI
 SxHQ==
X-Gm-Message-State: AOAM5312XxoKZgGghWdloY5j0tn1K09kSi3/FieIHgtnvzHABodAFmJ8
 or6RAZJTscFJqhSmicALEN4=
X-Google-Smtp-Source: ABdhPJwCWYVYtvfNiXCIHC6hjWvkcYPjMOJvdYlrbVenfAkiP95ySfEbO8ZKWR/hkV7JAZz4/4XQfg==
X-Received: by 2002:aed:20a8:: with SMTP id 37mr16058984qtb.362.1612195597071; 
 Mon, 01 Feb 2021 08:06:37 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id d16sm14675891qka.44.2021.02.01.08.06.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 08:06:36 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Makefile has local changes that will be overwritten
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210201154652.GK4131462@redhat.com>
Date: Mon, 1 Feb 2021 11:06:35 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4D69BB9-A711-4226-9688-9B824AA195FA@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <20210201154652.GK4131462@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ddstreet@canonical.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 1, 2021, at 10:46 AM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Mon, Feb 01, 2021 at 09:23:24AM -0500, Programmingkid wrote:
>> When trying to build QEMU I see this error:
>>=20
>> error: Your local changes to the following files would be overwritten =
by checkout:
>> 	Makefile
>> Please commit your changes or stash them before you switch branches.
>> Aborting
>=20
> This suggests you've made changes to "Makefile" in your local
> checkout that aren't committed.  What does 'git diff Makefile"
> say ?

It didn't say anything.


>> What I do to see this error:
>> ./configure --target-list=3Di386-softmmu
>>=20
>> I did some bisecting and found out this is the patch that causes the =
problem:
>>=20
>> commit 7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8
>> Author: Dan Streetman <ddstreet@canonical.com>
>> Date:   Tue Jan 19 12:20:46 2021 -0500
>>=20
>>    configure: replace --enable/disable-git-update with =
--with-git-submodules
>>=20
>>    Replace the --enable-git-update and --disable-git-update configure =
params
>>    with the param --with-git-submodules=3D(update|validate|ignore) to
>>    allow 3 options for building from a git repo.
>=20
> That commit includes changes to "Makefile", so if you have made local
> changes to Makefile yourself, this will cause the message you see from
> git. Either stash your changes, or rebase to resolve them.

I didn't make any changes to the Makefile. I even deleted it and tried =
configure again. Saw the same error about MakeFile again.



