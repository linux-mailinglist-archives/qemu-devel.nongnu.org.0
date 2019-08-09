Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A62876F7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 12:11:59 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw1sM-0002n8-Ex
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hw1r6-0001wZ-Eu
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hw1r5-0007hP-LG
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:10:40 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hw1r5-0007gt-Fl
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:10:39 -0400
Received: by mail-wm1-f66.google.com with SMTP id m125so1064206wmm.3
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 03:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=htZdG3yr7Gbrfs0N3mPJyhSPjNxCmK535M95U+FcSQk=;
 b=PXHPNRLyKNkoPZi93nHMZfs5f2TIIqff+txiZ0nJUb7G4wFyAk7RNOWWhBer8XONZv
 3Ocr8ofBiuEGm7VO+khd3vKChArchIjd9RqsG059M8eUOGUqTGCd9w8w/Fwumngpzvv2
 ahcMwm129xtvQYadw8Lgl5C/I4m1zrlrvX6voLctn/t7tsau1lVkZIbjYJRDzon6Qvlx
 kS3O4vYmrIAZARLU+yA+1y++/Z94F69w+Kx4/95E/xl28vooEP4aUamQPdXu+4mkLqOq
 eFxxscmrWwD7HIjVGhoDq1WQyBBGV0+/UzINjbwTE9CIvH3hnrw9hUlo5VwH6NnpgeId
 pCBA==
X-Gm-Message-State: APjAAAVVGZ3Q/KSRCInFRIImGhdLsOnADPoM5kA0Y3RQDwNUuSx84rch
 veJ50taToCCYdJ5ScWs47OI/zHnJPLQ=
X-Google-Smtp-Source: APXvYqxLRag0oHTr0y3WTKlX8h+J1rj3WP99Rv/h0anorkt4lkFXYEQAC0vFQvjqFMyoyE30nMymfw==
X-Received: by 2002:a05:600c:228b:: with SMTP id
 11mr10121203wmf.26.1565345438262; 
 Fri, 09 Aug 2019 03:10:38 -0700 (PDT)
Received: from [192.168.50.36] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id j2sm1046341wmh.43.2019.08.09.03.10.33
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 03:10:37 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190809064645.22656-1-armbru@redhat.com>
 <20190809064645.22656-21-armbru@redhat.com>
 <c76aaebc-d4bf-cb25-fe27-7a9c9ba644c9@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2cca54a7-df51-8a3f-cfab-9aecd0744db6@redhat.com>
Date: Fri, 9 Aug 2019 12:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c76aaebc-d4bf-cb25-fe27-7a9c9ba644c9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH v3 20/29] Include qemu/main-loop.h less
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

On 8/9/19 11:42 AM, Philippe Mathieu-Daudé wrote:
[...]
> netmap failing again :S
> 
> $ make docker-image-debian-amd64 V=1 DEBUG=1

To clarify an incomplete paste, this command doesn't build QEMU.
It build the docker image, start an container instance, and keep an
interactive shell opened, so you can run ./configure && make inside the
container.

> [...]
>   CC      net/netmap.o
> net/netmap.c: In function 'netmap_update_fd_handler':
> net/netmap.c:109:5: error: implicit declaration of function
> 'qemu_set_fd_handler' [-Werror=implicit-function-declaration]
>      qemu_set_fd_handler(s->nmd->fd,
>      ^~~~~~~~~~~~~~~~~~~
> net/netmap.c:109:5: error: nested extern declaration of
> 'qemu_set_fd_handler' [-Werror=nested-externs]
> 

