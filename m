Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02B54CB0D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:19:35 +0200 (CEST)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Trp-0006Ri-SE
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1ToC-0005EE-L0
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1To7-0004A1-Nr
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655302542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeSIh0Q7bZc5zMIgxV4RjVQqqnnX7WyOb6fWOAEY+lQ=;
 b=WW4MKRkdkas6yyt0EIoDhY0IZFppyen8v89fZMF+h9+fYPCzZGPYdwpyj0JC4Aa6Odmn/Y
 s7ILy4rcfasES5Op7Qwn8qOsdA+QpsfL6MUDdfg8vK3tlMD+953LWWOU6mmigBjWQ5MlaW
 y100AI0heM519rEXGq4MXguTjUc8NqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-jOhUWOZaO1SQHEEEGZSiRw-1; Wed, 15 Jun 2022 10:15:40 -0400
X-MC-Unique: jOhUWOZaO1SQHEEEGZSiRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso5125324wmk.9
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 07:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeSIh0Q7bZc5zMIgxV4RjVQqqnnX7WyOb6fWOAEY+lQ=;
 b=BTAAaiZvNm6sgxvT+uXl1LSaYGmv3fIwMAF/Vdzh/kPMuYhOYW66MYUOcMlL/OlP3s
 +ox8irkbTYueJrrFJYTzCykaGv5oq+Alk/XfHXxB2b6uNsAXN0kKh3PCycMqSkBxqfYd
 okkfNm6XY3cqCpFElkcu4w+XEMzxO5sedvx7KSEqKuUm69hpJJSXhMyZewqs9slRbkM3
 D0eiTT6Pj6Pq3lO6iDgXxVv7Io87K/K/urMAw6msOuz8nOZMa7wv7yULUgYNK+6cd9u7
 mbRRprm3pjVE3/X+5bGbOiCpWdl1l39R3qrpe3xSQ7+QDYURcXdz0Q0lx+T3EJJS33EU
 9nTA==
X-Gm-Message-State: AJIora8Sdbcd/1zaNuJ94cpmmFhLZAyFF9AuhTBFz2W5Et/Alkjq1tx2
 x34ZlANwfQmu5pAHjiQ5EiEpTR8wVNGLlgU6GeOusAJ7XX4YCayrAjk5ZwwS7/Wvo5FBHUOTS8S
 GU6R4EPoQTo56G1Q=
X-Received: by 2002:a05:6000:108b:b0:213:abed:50fe with SMTP id
 y11-20020a056000108b00b00213abed50femr12576wrw.425.1655302539378; 
 Wed, 15 Jun 2022 07:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2I9YiElaMvvDMNfc17e48uDKSd4FsKrDm1UIEfjuRniGVa22lt9TAMXsPV12Khr6tw7RyWA==
X-Received: by 2002:a05:6000:108b:b0:213:abed:50fe with SMTP id
 y11-20020a056000108b00b00213abed50femr12559wrw.425.1655302539144; 
 Wed, 15 Jun 2022 07:15:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfce06000000b00213ba0cab3asm15241576wrn.44.2022.06.15.07.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 07:15:38 -0700 (PDT)
Date: Wed, 15 Jun 2022 16:15:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: ritul guru <ritul.bits@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: regarding QEMU ACPI table generation and passing acpi
 tables/methods to guest OS
Message-ID: <20220615161537.7aec7656@redhat.com>
In-Reply-To: <CAHHF-2Kxj6LgiPB3gEy=r-e0QWGX7=BSxezqP6LjZ7V1MuEv5w@mail.gmail.com>
References: <CAHHF-2Kxj6LgiPB3gEy=r-e0QWGX7=BSxezqP6LjZ7V1MuEv5w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, 15 Jun 2022 18:23:28 +0530
ritul guru <ritul.bits@gmail.com> wrote:

> Came across below link about QEMU to pass acpi tables to guest OS.
> https://wiki.qemu.org/Features/ACPITableGeneration

that link a bit outdated (project was completed but than later QEMU
moved on to built-in library for composing ACPI tables)

> Can I get more docs with respect to acpi tables/devices passing to guest OS
> from hypervisor or dom0?
> 
> Looking for an example how an asl file which gets added in the SSDT table
> can be passed to the guest OS with the help of QEMU.


You can look at AML library QEMU utilizes currently to build DSDT/SSDT tables
  ./hw/acpi/aml-build.c
  ./include/hw/acpi/aml-build.h

and see build_dsdt* functions for examples how it's used to compose tables.

> 
> 
> 
> *Thanks & RegardsRitul Guru+91-9916513186*


