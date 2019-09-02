Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BEA5A1C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 17:04:05 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4nsC-00048l-Ge
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 11:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i4nr3-0003UE-6U
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 11:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i4nr0-0006Bt-T6
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 11:02:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i4nr0-00068s-O5
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 11:02:50 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BC86485550
 for <qemu-devel@nongnu.org>; Mon,  2 Sep 2019 15:02:47 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id x12so8944859wrw.0
 for <qemu-devel@nongnu.org>; Mon, 02 Sep 2019 08:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0WdYqeCpZ4B8u6AgJMETINz7jsQtzjua14G9j7ZELkI=;
 b=Nn5ohnaITtsxnhi/TlKcsEwZyg6STtw7s04vMO1p87O+EXvoH/SWEaPuo+xUUUfRI5
 XjX6clwbJgmVtHoRG2z9Zyz9d5BzUq48TvaiWf8Eef0M6nitHUQXPf8zqFy/o9UWi5bj
 55tgMlehvWmJpOIw4a92z32bmumbX+JC1MzxnZ+ML76nibOl3mtbpwyfsCYEZuXNLlG7
 9Cfz5BL4a5OKnh6Sq4I+fRrtKsGqwtKaUXdEaauYoB0gjDGlm1110yyIoM+d7D5uCUJh
 F1bWfuekjAxMGAr8c69v5Qjni27C7OtY5jWOPiVYCAk/YFkkpu7XmFJmm2XXR9B9Sgde
 y0wA==
X-Gm-Message-State: APjAAAWnQZ7EeQi8WohZ3hqBSVzTid+2NMd6zk/sJzkdZK7ELBWN9ltX
 Ehdee9wxoFxxNo/nwXGUgiqB7XQabCkPOIrqvhmwTVcX7c57MG6vW2WtNVUx3Yd9x6TJSoXSedH
 /7SWLtvNuUBO853E=
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr33620285wmk.24.1567436566473; 
 Mon, 02 Sep 2019 08:02:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5WRWQypHriXVUual1u5PuHfgkfAS7MP0smYwttjpyonkTw8Zm7KU5CvhQ1bIWC4vQXD91Tw==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr33620232wmk.24.1567436566163; 
 Mon, 02 Sep 2019 08:02:46 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id a18sm19581262wrt.18.2019.09.02.08.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2019 08:02:45 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20190817073628.94473-1-ysato@users.sourceforge.jp>
 <be47ad7c-54ce-3d55-2ae0-2f72c5730f7a@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dd18cf9c-27c0-5c52-4b17-800c46c0aa58@redhat.com>
Date: Mon, 2 Sep 2019 17:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <be47ad7c-54ce-3d55-2ae0-2f72c5730f7a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v23 00/22] Add RX archtecture support
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor, kindly ping :)

On 8/21/19 12:28 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Igor,
>=20
> On 8/17/19 9:36 AM, Yoshinori Sato wrote:
>> Hello.
>> This patch series is added Renesas RX target emulation.
>>
>> Changes for v22.
>> Added some include.
>>
>> Changes for v21.
>> rebase latest master.
>> Remove unneeded hmp_info_tlb.
>>
>> Chanegs for v20.
>> Reorderd patches.
>> Squashed v19 changes.
>>
>> Changes for v19.
>> Follow tcg changes.
>> Cleanup cpu.c.
>> simplify rx_cpu_class_by_name and rx_load_image move to rx-virt.
>=20
> Since do asked changes in the CPU QOM design in previous versions of
> Yoshinori work, can you Ack this version (or provide guidance in how to
> properly implement your suggestions, this is Yoshinori's first
> contribution to the project)?
>=20
> Thanks,
>=20
> Phil.

