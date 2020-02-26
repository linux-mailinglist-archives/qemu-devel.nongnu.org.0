Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D21703BF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 17:05:17 +0100 (CET)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6zBU-0002C6-FW
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 11:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jwsu1986@gmail.com>) id 1j6z64-0004d4-5J
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:59:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jwsu1986@gmail.com>) id 1j6z60-0000T1-73
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:59:40 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:41763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jwsu1986@gmail.com>) id 1j6z5z-0000LW-T5
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:59:36 -0500
Received: by mail-oi1-x22f.google.com with SMTP id i1so3501617oie.8
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qEslQTb6NfUlEES6aHrAIaZPUZEDF9hqQ9sNh5g0wIA=;
 b=dLDC7I7eHECtMCc0ZGu1EyjoRqyv8bosl3bVG/qBDqqSlnsO7ElV5lz/9i9IonFGi+
 qs6zh3Joz0GfJNDdoF8ja0YzwexTeSZdGMFZogd1ISyNRnoFpB6Tqh12X0/fIhh7+jHP
 v8MIGUSRb2TuDPcoZ6xx2FRugXzXsFx6Qi++rgaCmD5hpfvA6esI1TKui3pRcsd91mft
 wsO7I5mOOuP00n+3JBB8hFTKcF0SRT6UCvkHaGfjRNCbaaqokM6Gg0j5Be+oaAzL3sXO
 +gRB5RQUO+XiY0XavczBbUDO25dW8HFUC3ZqC1qtwLUvDNjPUBt7AH1iLJQSP7dO8Aa8
 pwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qEslQTb6NfUlEES6aHrAIaZPUZEDF9hqQ9sNh5g0wIA=;
 b=ucPuQ9s4pb9l+2IIr+8/M18OfWpEcPgQCkU/nLQ9hsbVyiGHWpHxxrHan7IBYzvQm1
 /wEDUzur88YWRwM9llmEjEdb9k7jvxVj+Yo2x79fkv82V0kAsDTeDTkCVxNopR5xi8cV
 15vkYRk0Wb37P4EVXGMSgk/bcA0NRuh2Lbk575iWXSQg75e7Ju5tytO2ajIOL77lrwT1
 WfNDOomqqhlQtuTkXKVUg7UW6asylWmbGd38+XWhzIq2q9S3BrE1R/aVEaJyGfZpTA/f
 YKFBGuOq9yWe7ZC+v9D1DRjr0KQLje3nfD29gBAH0G2MYyJUXxhS0ZBlDTFDBoGtx9WZ
 uLBA==
X-Gm-Message-State: APjAAAWgCZpBkjaUSHCVwIkDRTnYDKwLIUBQkGTg9OnmHinsGLi23zRx
 4nthdxg2IrV/iVZwYwN8gYk9J5iLW89FxMPHo1JnO164
X-Google-Smtp-Source: APXvYqzRAR8eeoG40WndY0n1woaDbQQBsGsWbSDXhGiHLx+4vtfTGuPRxy89+NB8OSNk0mckhn6Xg1swd733rgjgPF8=
X-Received: by 2002:a05:6808:64d:: with SMTP id
 z13mr3720546oih.104.1582732774433; 
 Wed, 26 Feb 2020 07:59:34 -0800 (PST)
MIME-Version: 1.0
From: Jing-Wei Su <jwsu1986@gmail.com>
Date: Wed, 26 Feb 2020 23:59:22 +0800
Message-ID: <CAFKS8hWLhXNnVgRsADhrG+N0grgS_-C9bAfC8-oU0spbyy=vVQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 3/3] Update Documentation
To: lukasstraub2@web.de, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
X-Mailman-Approved-At: Wed, 26 Feb 2020 11:04:11 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Lukas

If  PVM died, to let old  SVM be the new PVM, the old SVM's
filter-redirectors(f1 and f2) are removed in your document.
Why don't you remove the filter-rewriter from the old SVM?
The filter-rewrite is kept in the new PVM. What is its role in the new PVM?

Thanks!

Sincerely,
Jing-Wei

