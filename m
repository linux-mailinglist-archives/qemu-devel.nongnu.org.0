Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214963E5997
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 14:04:08 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQUI-0003ZT-Vd
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 08:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS4-0001By-Tb
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS1-0004qk-Ka
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 08:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=FPa7X9IV/PQ9vwUG/+HHosiGO6Uz5j9T9EheWB+kZqkxgvhfKNipd/NrNY7U5RYvKiYSWm
 Oi5gZglqB5qPZxeZnN2l2jHY8Ev/5zbNjbhT7iDPYcHZ3gfUAVhI2itpb7j+Y06zU8BTJG
 Rq0qKQdNTX6Xah804hOsB9HYrmR/r1A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-OeRf0sifNgOasCTNaz-wBg-1; Tue, 10 Aug 2021 08:01:43 -0400
X-MC-Unique: OeRf0sifNgOasCTNaz-wBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w1-20020adf8bc10000b0290154bed98988so5040793wra.1
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=Lc1Ypi/BCk2jUSFYkC1iPutxtFrTdXU3JZfYYwgCP1CAMo8ziZpRO1aVQwv7vF5jMU
 LMM6N3RBVSo2j/N1E/GdKK7DFF6M8fOxj0wZEXb6jaS9p7Nl90XcFWrbe2dTteZoPiYc
 0dvTghSpAP24JK4fzrZXokYOI4SAlIuMKza+LEccgx/iVD3Dsfi7qqzoFhl8JPXeutG1
 3mxyPbOCTaKV04ar919YqMJ1MWiVZ41kzJnvx4ATZORKbl/dEQQuiruqiJ2rJ9qEMnlB
 A0Mh32Gurg6JeeEu8JK7BsgZCw0CcReDnrk9qZwRWnq81tLp+94CO3rTzqKV8m1Wa3n0
 hwdA==
X-Gm-Message-State: AOAM533RTPNoCsdjtdu8QR7KfL9Irg/JI2YnHYwK2F4hvJSbTLgELv9F
 xKaS+eUjYE92p3TvgsJZHyBmhBHu02RYW98hSN5SO5HXcwcRAut3B5JFFaQzg2/qCNvp8o3dDPu
 rew/z28AhFalBYIY=
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910126wru.343.1628596902441; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3hzXJq/uMeMUgLEKYXP7YdeYgeEjV4RTqS2QrZnBsjiQwGsXJUTgme4xDTdtVLt8j8LEVnA==
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910057wru.343.1628596902136; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id j4sm20637348wmi.4.2021.08.10.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:01:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
In-Reply-To: <20210806211127.646908-6-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Fri, 6 Aug 2021 17:11:20 -0400")
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 10 Aug 2021 14:01:40 +0200
Message-ID: <877dgt1paz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Vijai Kumar K <vijai@behindbytes.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <minyard@acm.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9?= =?utf-8?Q?dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathi?= =?utf-8?Q?eu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - split "typdef struct { ... } TypedefName" declarations
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Just curious, how did my name ended on the CC'd list?  I don't see any
file that I touched or that is migration related.

Later, Juan.


