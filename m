Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64825700D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 19:53:48 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgC79-0001rS-W9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 13:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34463)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hgC4i-0000PK-9s
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 13:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hgC4h-0002nU-9C
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 13:51:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hgC4h-0002mN-2a
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 13:51:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id f15so3775056wrp.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 10:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bAZScsGEmeNZb2K2Hp2sCw8MLGRk42kD8WT7LjGEnF0=;
 b=FdokDisrk/0kn12xvnGmbu2USIbzg4daoFO0kaJr7U5B6H+y8dbvLVcq5tw7ck7uNb
 +FYNZnvlI5UoTQ55zHmPzAvV+CliLcswh/HIYcQKWSxdDTe/3s6hdCmJtoNi5m1ad1ka
 AjddJWHI0boubH+BUpj8Pp/QdHgttUad3edVtjUy26ANPmfkZ2OQd6I8nCuJupY1PPqX
 iY+MjS56oj9gMsIWVMujCA/cMowzcitBJAGzdGgn/caV0SuBA+eIOpo2fFbt0NBE4I43
 qK7aRO7auEm6yOBuprDdfFXl4yxFSYmlR/BqDnOVgdOPILe5Lj1mi4wDRAo4Bx3G8LwW
 CKTQ==
X-Gm-Message-State: APjAAAXLyluuHiIlPqYTpUQ0OqNslBaq6xA6q9jBk2uii6LFZGMlGsUZ
 eMBeSp/ulDcROpiel0WWUNHrKw==
X-Google-Smtp-Source: APXvYqyJPHZ85m2odRBvXdHLs6OaW8SLqIuD3o8U165h2zh342uxWPvI8asQI3HVz8+YuYgW/W/kkQ==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr4423603wrv.268.1561571473446; 
 Wed, 26 Jun 2019 10:51:13 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id 11sm3212807wmb.26.2019.06.26.10.51.12
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 10:51:12 -0700 (PDT)
To: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
References: <20190619221933.1981-1-laurent@vivier.eu>
 <20190619221933.1981-11-laurent@vivier.eu>
 <20190625183019.3cb231d2@thl530.multi.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a4e9bd43-6e5c-a893-d57f-2cff20df5589@redhat.com>
Date: Wed, 26 Jun 2019 19:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190625183019.3cb231d2@thl530.multi.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH v8 10/10] hw/m68k: define Macintosh Quadra
 800
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/19 6:30 PM, Thomas Huth wrote:
> Am Thu, 20 Jun 2019 00:19:33 +0200
> schrieb Laurent Vivier <laurent@vivier.eu>:
> 
>> If you want to test the machine, it doesn't yet boot a MacROM, but
>> you can boot a linux kernel from the command line.
> 
> I gave the patch series a quick try, and was indeed able to boot the
> Debian installer with the q800 machine, so:
> 
> Tested-by: Thomas Huth <huth@tuxfamily.org>

While this reply is valid for this patch, was it meant for the series'
cover?

