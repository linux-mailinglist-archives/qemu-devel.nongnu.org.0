Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7626A1FF9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbD8-0008NF-Po; Fri, 24 Feb 2023 11:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <primalgamer@gmail.com>)
 id 1pVZq9-0004I3-Cl
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:18:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <primalgamer@gmail.com>)
 id 1pVZpx-0003GX-TL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:18:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h14so5599214wru.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ib7M1p12eQ0CkizoBpWJs0u8FAx3DESfG0CRhXaw1O4=;
 b=VZQVOZdjKoDdHJtwTctGvzVN4Z+CsmuCDwWCFv41jhvgdcy2Pp6Wpi3aQXjJWY08QW
 MDiKmflY3TP1dfka3gPORhs45kuNQYaagj+s/57WAKXhoRjEYZodK5JF8kAEWB/2aqhi
 vgIFkrIzUCYvJTFlxWsFERErCU3zr4ueT89gZoGoYTC6gHywzmXYEYrE89ct0RZikMxc
 g2t1HB1AiDebQGa0SN9xQFW3+fydQOYNuoQKx8I/cWzxthT307dXXqGb9WMhJ+f48lGr
 aUxAtWSyQ/xUWf/HJpUvcRardK710Jc5kmL4KkMdnfthpIjDF1wP5DbC4nD07kMzTfJd
 aqwg==
X-Gm-Message-State: AO0yUKW05oT7LcpatJDZW6dMl/sNh4fkZZkzmpZKimGyCNCwjKT2YlEJ
 jAnCRPxoqZVzeTrbNbCqxzA=
X-Google-Smtp-Source: AK7set+w/5Q+WwcreLptg80h6qfL26G9hdP21WmZqXt1oF9VecwCXYoTA0lU+41L90WBkw9PoypzWw==
X-Received: by 2002:a5d:408e:0:b0:2c7:deb:c61 with SMTP id
 o14-20020a5d408e000000b002c70deb0c61mr7058325wrp.39.1677251877525; 
 Fri, 24 Feb 2023 07:17:57 -0800 (PST)
Received: from [10.148.80.132] ([195.228.69.10])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b002c54c8e70b1sm13461814wrm.9.2023.02.24.07.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:17:56 -0800 (PST)
Message-ID: <b155ad6fe6bb026377a8f75882e26078da10ab70.camel@inf.elte.hu>
Subject: question: QEMU guest with Virtiofs but without virtiofsd
From: Ferenc Fejes <fejes@inf.elte.hu>
To: virtio-fs-list <virtio-fs@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, =?ISO-8859-1?Q?P=E9ter?=
 Antal <peti.antal99@gmail.com>
Date: Fri, 24 Feb 2023 16:17:56 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=primalgamer@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Feb 2023 11:46:14 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi!

I'm using a QEMU VM with a debootstrap rootfs, shared over virtiofs for
the guest. My best understanding is that virtiofsd must required even
if just using one guest.

Looking around in the QEMU manpages I got a little bit confused by
virtfs parameter. Is it something entirely connected with 9P or it is
possible to pass folders to the guest through virtiofs without
virtiofsd? Unfortunately none of my trial with the parameters
succeeded.

Could someone can give me a confirmation if virtiofsd is must or its
optional. Thanks in advance!

Best,
Ferenc

