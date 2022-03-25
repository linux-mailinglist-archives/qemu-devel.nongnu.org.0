Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858714E6F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 09:19:59 +0100 (CET)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXfAs-0004KI-5f
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 04:19:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXf7z-00034b-0X
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXf7v-0001x0-J3
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648196214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoOKNvjj2vWDxyF7ffnwny5Y6LqscjN6R/Mgh0N0bXE=;
 b=cJZEZxElorQ/IqDqXI/SzjQWeKK0l7pulVYlwpalrNu4lAJSJp2uM+OBpeRAvJL9ecBjOe
 RLhZ85PZ2+FNPiSrz4CafISSxkZXAXLEH8MlWWyMh0TQPX3dK5vKzYCC6euFY7GVodDESg
 9z572BG1aOvVVycPlecXNqB48bXvtn8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-DcAQRyHkM3y4TZgS20owKg-1; Fri, 25 Mar 2022 04:16:53 -0400
X-MC-Unique: DcAQRyHkM3y4TZgS20owKg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p18-20020adfba92000000b001e8f7697cc7so2444521wrg.20
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 01:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwOCm9uy0SJhZBHOauUhE1KdI2YgTHt0QQdRB9YjSqU=;
 b=D64tQZbetFfi0WRs2/Jw9o1d99CWZLCYRLjcqC4IJlkvUFYgHiukNRe1TBKndblgp+
 bbZfLfJi6TBUgel8kNMhQg5t2IdJdiSEv/RsugpxUah1pIAo1OEHqudqc9dp9r47J6bH
 ZjJvw6phwOuwb32Uz453Cc2oz2eGN+KtyJCbJGgM8zW9+4ID7lMxQThMNfqtzPp5xZe/
 W9tGU1fsfF7h+cSsSh8YKTqww1hlFIL4YehBDrHO/ppuVRhAnpon3vTo36jkGTMya9tc
 JNdtKd658rhPhIrYbQjRObu/YwuJ/DNsu+7RFYAGuifG33tUzSezHY9mF9IXrPypJX5u
 h65A==
X-Gm-Message-State: AOAM533qaU5FaAkEMVkMXb6KqE7+v78EFllUQpSboQieUVghYbfR5HcG
 bypIkYFQNrVxwZCQR6ExeReViCkjFtaHRHFFae21iu/v+R4/Nl6r/BeT2F16HNKURnawlG0CbfT
 szqShaQ/MjEa6WUc=
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr7905364wrf.584.1648196212055; 
 Fri, 25 Mar 2022 01:16:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZcd2ZrK65RzkNpR2Y78SKa9wneAAYU7LYVgCN85ji7GZcSkxSPymDGyILfMaSIJpFsrs3GA==
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr7905325wrf.584.1648196211800; 
 Fri, 25 Mar 2022 01:16:51 -0700 (PDT)
Received: from localhost ([47.63.10.52]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0038cda9f92fasm2453441wms.0.2022.03.25.01.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 01:16:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/32] Move CPU softfloat unions to cpu-float.h
In-Reply-To: <20220323155743.1585078-29-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:39 +0400")
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-29-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 25 Mar 2022 09:16:50 +0100
Message-ID: <87r16qe9al.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, "open
 list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The types are no longer used in bswap.h since commit
> f930224fffe ("bswap.h: Remove unused float-access functions"), there
> isn't much sense in keeping it there and having a dependency on fpu/.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
> index bf4d440308ea..e83bfccb9ecf 100644
> --- a/migration/vmstate-types.c
> +++ b/migration/vmstate-types.c
> @@ -11,6 +11,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/cpu-float.h"
>  #include "qemu-file.h"
>  #include "migration.h"
>  #include "migration/vmstate.h"

Reviewed-by: Juan Quintela <quintela@redhat.com>

I think that the rest of the patch is also correct, but as there are
other maintainers involved.


