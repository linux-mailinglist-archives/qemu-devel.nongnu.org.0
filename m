Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E986F563D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:31:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9lj-0002Dd-E5; Wed, 03 May 2023 06:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9lh-0002Ci-5K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9le-0006jr-T6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683109886;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jomI8TSUfSqC5jMoj2cmZXKKX5UdztfJ/1fu7WdWnc=;
 b=hK96bXh5crXhsGYZFw+vNs5kPaoOjd0IhcOVm9PjrtENpg95RoIq99TqGXrS8rfEiJKXIW
 8ujSy35xolk9beqQsYxqBARQ6TzlJkaSPeO1MTHieSxRnuXurdR6XxpXxOSZ4ukgCOch8I
 gn/6lfwlnG2aEUPAREu93i57/bo1IcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-Hz4_YDQhMX6pUTNdWY-xbw-1; Wed, 03 May 2023 06:31:25 -0400
X-MC-Unique: Hz4_YDQhMX6pUTNdWY-xbw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30620ebd3c2so2838665f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109883; x=1685701883;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jomI8TSUfSqC5jMoj2cmZXKKX5UdztfJ/1fu7WdWnc=;
 b=ZXJDatBn4o4icxl5a7KIBFAuRVt+TZ1a1MaBKo8u/wLwB4UPYjZDpH2aewJj3V7i2f
 5zUNv0Qkk+LZU6ly0xP9/uUV/DAauw8Qg0cqWKJDK3sqpfFwhDwOKM2QPc8JCFrCRKX9
 YPHZ9MUzSxqivaPu8JTzXgkMB9MCmmeAU3TzFK0MD5WpQkIDiWkbkKPWnKCKi5lPnOJE
 OUGFxm2mTQ5G6J/aAjpgBJI9quGaZdHqhHL32Q7amk16R0so18nm6KV+phjUiDFfVf7m
 Yper5TBMoCEJhLw77Luus8Ccq9E4WWvlbNFf42anK8LMsiawGu1uQwikb64kDBA24I2M
 +JqQ==
X-Gm-Message-State: AC+VfDyV4A4YYI7tl0ymOhR/aOD4xR47URGw9Jgk61h0nSQGJjE+To3k
 GNQKjTjEYWQ/W5wl3ZivROmigCIXN3rCPbcZdQwO+ihPXK61D8GbhI2flf11pIOVP16aW5B/x76
 RMYwa3nnm7/teJAoXN6SMFRhYSkUl
X-Received: by 2002:adf:fb85:0:b0:2f8:cb68:8203 with SMTP id
 a5-20020adffb85000000b002f8cb688203mr14889122wrr.0.1683109883793; 
 Wed, 03 May 2023 03:31:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CMoOvvjRQnLaTskhve8DUV6DhO/f6sB1mvzBXIYbzcsSrmr/MldTyaxOJ8vFl0kLBgRuxbg==
X-Received: by 2002:adf:fb85:0:b0:2f8:cb68:8203 with SMTP id
 a5-20020adffb85000000b002f8cb688203mr14889103wrr.0.1683109883499; 
 Wed, 03 May 2023 03:31:23 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c9bd71fsm33341734wrw.93.2023.05.03.03.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:31:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Artyom
 Tarasenko <atar4qemu@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Helge Deller <deller@gmx.de>,  Xiaojuan
 Yang <yangxiaojuan@loongson.cn>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  John
 Snow <jsnow@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Andrew Jeffery
 <andrew@aj.id.au>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Beraldo Leal <bleal@redhat.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>,  Joel
 Stanley <joel@jms.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
In-Reply-To: <20230503091244.1450613-7-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:28 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-7-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 12:31:21 +0200
Message-ID: <87354dso3q.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> From: Fabiano Rosas <farosas@suse.de>
>
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
>
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=3Dn (due to e.g. --without-default-devices):
>
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom fo=
o.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-7-farosas@suse.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>


