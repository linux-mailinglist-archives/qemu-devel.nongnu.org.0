Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A65BF176
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:45:01 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamvE-0007DM-Bw
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oai47-0002uo-3G
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:33:51 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oai45-0004xd-JO
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:33:50 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3457bc84d53so38254057b3.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bUkuv49WVFk0pvGdqCvxzqO+1qjRiWmJkEhd6Y/sKW4=;
 b=kxPcU5OLWFN9YqhFbY/X8jdBT/45HYDxPUSopQGgzYUq/nxliJYLHKSdpv3LwK4+b9
 FxFkVbF4aVgyk4k2pY4OryTdD1mNq0aoCJB9p9unvmaLPnQ8HDBNwbOuqtPzvbawRGqh
 Xmj1J/dskEjbT4JrKXNV+Mbj6Q7Sijw2nkc1hD/z3MBAgKkoHZfbV2WKf5oW6XTlhqrY
 44BBTz23pgcB4FT2ulnxsRXGKpN9CkqplkLyegvQvVS6N8RIPtq/HFV824fYE1QLYbm0
 EXfWN9xuMRhJ4sVm5SBfNJLXqIcnpXgkq+Jrs2vXoO/GxqXWWA6lecsx1l+/tWS+WcOG
 QiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bUkuv49WVFk0pvGdqCvxzqO+1qjRiWmJkEhd6Y/sKW4=;
 b=nNf3hNOpQAL3aj5bloU1dbzA3ZJ/QM5LDms2VO7Qq8J5ZqVdznBOYe5AHGO+LsIkyq
 2ZFrSGPtwHkXkmBrBajh+Lq3C7vXhSYGVoyCGEJZCtIaYEV0xvaGm6Z6SI6HLANQk4WE
 /I5Y0Ay0Q2MYhYn4BKwVad12iNqt1GHvJvyQV1DS43EJQXYNhslapT90JQ94eM2Gdokm
 HfR12lE13Wq6N3k/WNykHbEi35+pO8MfPvkOAI3AFin08khtwj3xLlYBGCOZgh+Qe/Is
 MitTExklLZzeV5g729MLxC+ngtYXlvilJkK29fqNuCHa+SM9gChE76Uli8plcF01ubid
 taJA==
X-Gm-Message-State: ACrzQf1NxBBcq67pY123s3vPelR3wzaKJoZB1kVtDMIRWYrDM1LGm6rS
 UVNXSOYRfZHFnrytGHLjPd82BVGS7rrbYc4XV4c=
X-Google-Smtp-Source: AMsMyM7Y0TnHSmX2y9SX+U0VPbv25JczNFYBkNg1oVh6HckZpC/BvbRBg7jgTceKDqONHr4Qea4j04FKf3ayUwctHAE=
X-Received: by 2002:a81:66c5:0:b0:345:3b1c:26 with SMTP id
 a188-20020a8166c5000000b003453b1c0026mr21956777ywc.156.1663698828374; 
 Tue, 20 Sep 2022 11:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220920095058.4124145-1-gaosong@loongson.cn>
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 20 Sep 2022 14:33:36 -0400
Message-ID: <CAJSP0QW1mEikWhNcs47b7_JQ8176BimrZQ8_aqU3aABi1p1yNw@mail.gmail.com>
Subject: Re: [PULL v2 0/9] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Please remember to push your GPG key to the keyservers using gpg
send-keys YOUR_KEY_ID.

Thanks,
Stefan

