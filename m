Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0350B6AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:59:00 +0200 (CEST)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrwB-0003Mk-Jy
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nhqk2-0005Yn-A5; Fri, 22 Apr 2022 06:42:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nhqk0-000090-Ah; Fri, 22 Apr 2022 06:42:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 17-20020a05600c021100b00393a19f8f98so2121164wmi.4; 
 Fri, 22 Apr 2022 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=eKXctPbdF/XsgsBlo5qPoVJMO+HAPxUlXw6G7HgFefU=;
 b=QNq7ayM9GRL2fPTqwi7anyejh0pIItR5Lp0nv1GZIwTAskVUMmacDUCOEz1amSydBj
 PwTwIi2MlkTqz95CWAsZJO3KLNxl4L985JLVU9KAqGY6N3lArozzkjNpXK4iVkqzGBaz
 DAXlBV68hD/GjR/+jWj32dSylqJb3oWfSxmNkXcvNgItmxqkBzE7cCPXBq3jGsHL/BlI
 AldA95UPDLAsx/VTk5ngXQb09bP+nR+6GOirGtfxvK/pnJ8lfV8LxpjvKq6ahgv+AyXl
 /mwlaMxhMDJScI1OFWUVXQxLbFU6h2viKBw+KbavkiV5WVkbJl+K81QAIxG2zjN/Kj+o
 YyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=eKXctPbdF/XsgsBlo5qPoVJMO+HAPxUlXw6G7HgFefU=;
 b=sVEHP6f6qIiqsu/2DdiBfdN3bEl27PF+syvRat55YJgD0CnUT08W5FAcMd7aJFbrFb
 9S+SS7Lwz8Q3zN7rsK++qAoq3Djy1FzKsir7NgS6hj+VLcYRK+fijxNxZM0s8HZJnJzA
 HhCh83Ez2nVd3+QWMil7D+KI9POz5ehk88VbBnPoP6gKvmjSuGKcdu+rs3yXePsrjKoe
 92V/O/pWMFsqkB0LX5TwtkhH8VJ2DABSapUHHeaGBR3+ubhKQmz41NjyC8tqKjwYTZNL
 pvuUwbaMYDd5OtM9Sprco03DH6L57AOxuStvX52JILCQBVd4eE4pbf/p/y0ini26+tiL
 Wzxw==
X-Gm-Message-State: AOAM5327nADCmpp39GAxftkAhYnfPlMGsuohXYjACXubJDXE0XpmQU9y
 xHni5JAFqhYuHryS5+ij/rg=
X-Google-Smtp-Source: ABdhPJwRF/zExrX05fPbIeE+eUR/xvlE3aIUCzS3Io02y+Cb9qkNti30itGAEe6d4d79tcQ1qe/n4A==
X-Received: by 2002:a05:600c:3011:b0:38e:ba57:8b79 with SMTP id
 j17-20020a05600c301100b0038eba578b79mr12551969wmh.26.1650624130035; 
 Fri, 22 Apr 2022 03:42:10 -0700 (PDT)
Received: from smtpclient.apple ([2a04:4a43:446f:c914:5df4:343d:9921:2393])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0020aa790a258sm1492663wra.8.2022.04.22.03.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 03:42:09 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Carwyn Ellis <carwynellis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 2/2] hw/display/vmware_vga: do not discard screen
 updates
Date: Fri, 22 Apr 2022 11:42:07 +0100
Message-Id: <1FAF24C1-40C7-4D30-BF33-FD6C933DD07E@gmail.com>
References: <20220422104030.kte6wcu3zc4oywey@sirius.home.kraxel.org>
In-Reply-To: <20220422104030.kte6wcu3zc4oywey@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: iPhone Mail (19D50)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Awesome! Thanks!=20

> On 22 Apr 2022, at 11:40, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> =EF=BB=BFOn Sun, Apr 10, 2022 at 05:49:30PM +0100, Carwyn Ellis wrote:
>> ping
>>=20
>> https://patchew.org/QEMU/20220206183956.10694-1-carwynellis@gmail.com/202=
20206183956.10694-3-carwynellis@gmail.com/
>>=20
>> Originally submitted as one of two patches, the first patch to use trace e=
vents has been merged, however the patch that fixes garbled output hasn=E2=80=
=99t been reviewed yet.
>=20
> Hmm, slipped through for some reason, IIRC I cherry-picked the trace
> events patch from v2 series and probably simply missed v3.  Queued now.
>=20
> thanks,
>  Gerd
>=20

