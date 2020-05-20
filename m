Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E21DC17A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 23:39:15 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbWQk-00045J-Cy
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 17:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <greatquux@gmail.com>)
 id 1jbSlh-00033Q-Pf
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:44:37 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:45723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <greatquux@gmail.com>)
 id 1jbSlg-0007Ig-UJ
 for qemu-devel@nongnu.org; Wed, 20 May 2020 13:44:37 -0400
Received: by mail-qk1-x72a.google.com with SMTP id i5so4372370qkl.12
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:user-agent
 :mime-version; bh=yGRgLX8KyBUfh1dKkQe6460Rwdc7PLR+dor60P3m2PM=;
 b=im184+b3OeTiV6x3mH/mQIx1XZvDTTRn7pllj9rvvY0LdALMG876mFOpeidLghgZxP
 YE7SYVil6l5H48WVOe6dETa14n5pveAfQ0dYDQhSCDnf42YgPbrnN3FKrQTHe5aeuE6o
 DTS5fWBwQ3zqh4Y4CIRszfXEYEbps4chix8wJbLo0mOjAbUoytWYhsWLcmhJJLEyhtVJ
 q+3S3xB9vthVjC5oB+s4cEmAAz664vG2bxVm42Shevx0KngDfWTrFelN16LHk0yawLiz
 lXt8ktGUy8XJUmUblfIPwMUWulbK6zVOeJtonAqNgqUb+Ik5jaMB9CmbqnwWPFPkVgRa
 Rgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :user-agent:mime-version;
 bh=yGRgLX8KyBUfh1dKkQe6460Rwdc7PLR+dor60P3m2PM=;
 b=sU6jPTnP5zG6b92mYIGqICLAFNb+/b1NjBFNsxFJFj4XkdHxrzNU6r5+PKOQ34b867
 +/0hMRq2GMkbV5JULd/cqT9NNvGhZIuHZ6TucK0eIW8pmc0DV5ooZFgWBUsGgfI5rpBE
 OjhxWH6HLXgrwxAHxb1j3lZpIgc7HCpcjDQoAANx9TIlTEd5LexuMMUf0oxLN8kkg99A
 95TX09yS15SBfOeaSdiljlUBaHD8dtIYp1OJcqqPRxnrKRyvUtO+V4TjFMKEgBd68vk0
 PAZtkPnAmNN3kjWwbrVb1SgDx9yhjqeBEhL6f94MPBPNXwCN2C3LdW6fX8p/n6CBLniO
 qfqA==
X-Gm-Message-State: AOAM5315dpa8J8m5p/DN5MrHGD2TsRBmrws22c4AyEfzmTY9gaeDpzzZ
 3mP6BC3awOjOPa28TqbOjU4=
X-Google-Smtp-Source: ABdhPJxdRoiMpIbxsc1Xv047hRJF85nlUPN+podXKuHQ2u02ctvSECJO8l4rwlRKem9JIa+rX7k5fA==
X-Received: by 2002:a37:4e4e:: with SMTP id c75mr5999682qkb.143.1589996675269; 
 Wed, 20 May 2020 10:44:35 -0700 (PDT)
Received: from ossy (pool-108-27-241-12.nycmny.fios.verizon.net.
 [108.27.241.12])
 by smtp.gmail.com with ESMTPSA id 23sm2683595qkf.68.2020.05.20.10.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 10:44:34 -0700 (PDT)
Message-ID: <b7b2d3921fa6d2274c63b8b58f655bf293139598.camel@gmail.com>
Subject: Re: Emulating Solaris 10 on SPARC64 sun4u
From: Mike Russo <greatquux@gmail.com>
To: jasper.lowell@bt.com
Date: Wed, 20 May 2020 13:44:33 -0400
In-Reply-To: <be68b7ad559ec17c69439217c1378c23e30745c9.camel@bt.com>
Content-Type: multipart/alternative; boundary="=-z0p+ktn1hEPHibtMFiqQ"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=greatquux@gmail.com; helo=mail-qk1-x72a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 20 May 2020 17:38:13 -0400
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
Cc: tony.nguyen@bt.com, mark.cave-ayland@ilande.co.uk, dgilbert@redhat.com,
 qemu-devel@nongnu.org, peter.tribble@gmail.com, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-z0p+ktn1hEPHibtMFiqQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Using the proprietary firmware for this would be ideal. It would also
> provide reliable access to the kernel debugger which would be
> extremely
> helpful for diagnosing what's going wrong with the console. I'm not
> sure how I would go about making progress on this though. I know there
> are binaries of the BIOS for Sun4m machines floating around but I'm
> not
> aware of any for Sun4u machines.
> 

I haven't been able to find any of this firmware either. Not sure if
this helps but someone says they've got the Ultra 1 firmware (along with
cgsix and cgthree) available here:
https://people.csail.mit.edu/fredette/tme/sun-u1-nbsd.html

--=-z0p+ktn1hEPHibtMFiqQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><div>Using the proprietary firmware for this=
 would be ideal. It would also</div><div>provide reliable access to the ker=
nel debugger which would be extremely</div><div>helpful for diagnosing what=
's going wrong with the console. I'm not</div><div>sure how I would go abou=
t making progress on this though. I know there</div><div>are binaries of th=
e BIOS for Sun4m machines floating around but I'm not</div><div>aware of an=
y for Sun4u machines.</div><div><br></div></blockquote><div><br></div><div>=
I haven't been able to find any of this firmware either. Not sure if this h=
elps but someone says they've got the Ultra 1 firmware (along with cgsix an=
d cgthree) available here:</div><div><a href=3D"https://people.csail.mit.ed=
u/fredette/tme/sun-u1-nbsd.html">https://people.csail.mit.edu/fredette/tme/=
sun-u1-nbsd.html</a></div></body></html>

--=-z0p+ktn1hEPHibtMFiqQ--


