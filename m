Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE85FEDB3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:59:08 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJLG-0001oz-U4
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojJCh-00039M-Bd
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojJCa-0004hp-BY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665748202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YMzEUUYDS27NyzU3f4MXJw+IKSh+Qk7Bj8/bPNGbbKg=;
 b=Ujq/axeiWj8HRo20X9+TCQizkS9NqJdjKtC2SbEAHpOyh8BsAP8+ON8701yU0V6c1piJnM
 SNJshrlIXeM7HtmiitcJC0TKA/sp4i48xWghQ/wUcUulB9vLfJeUrXjLdqOVNxnEpY0EYD
 kvKvXRO9KjCDsN+04gu9k2xKWay38Ac=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-OBUItIkNMvOcV3e-eSo_2Q-1; Fri, 14 Oct 2022 07:50:01 -0400
X-MC-Unique: OBUItIkNMvOcV3e-eSo_2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfa548000000b0022e2bf8f48fso1880332wrb.23
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMzEUUYDS27NyzU3f4MXJw+IKSh+Qk7Bj8/bPNGbbKg=;
 b=DAAFUYbxkZ1VoR2i8Hnn85QLNNT9n4QeE5zClPIkOAGzDM2Xyf4k7LAnc15Ns6qfrF
 bUdUAVMWaruhKZXWuYW/e3z0quJaulnWHU5eqFkfSUgnQMJzP9LdSBA80lkosQTe0sK5
 PbxJ6QMu6b724HyyT8WtZvIVkw6b3nFWVoaoS4uywQF67NRRRIsGHwACG2/twVY5TM10
 Xf2lVMSO1CjLkd4vVkmAtCKU2dYXryUm2BQX8QPn0PDbEeGGncf+yx42MftqgUWOC2TX
 n/aLxQJwAeaM3QnO22NAGwejBPXUj6zOVYi9yQiXFyJkQPmKMcEezrU5xINolWME+9Jx
 0bkA==
X-Gm-Message-State: ACrzQf3SCCe0uyVhn7os0HaY80ykplw3TpH7MxzVY69d/45qECOBKWFH
 luybp2Y1PWBeuPBZ+eL0kMulHml6xuyr9x7GAuEH2uotZ4ejEPWfxiO0kVESbMqJ82I9EHszwXk
 KYpexfJaAA7gj7C4=
X-Received: by 2002:a05:6000:18ad:b0:230:6d12:fc7d with SMTP id
 b13-20020a05600018ad00b002306d12fc7dmr2991012wri.409.1665748199873; 
 Fri, 14 Oct 2022 04:49:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5yoJqcDFCSQHpKK+1w/ZQf5Y5fykQ0E5wlWzHxjYrE/6dlnysqAuTUsu82I1E6DzpqwUJTxQ==
X-Received: by 2002:a05:6000:18ad:b0:230:6d12:fc7d with SMTP id
 b13-20020a05600018ad00b002306d12fc7dmr2991004wri.409.1665748199693; 
 Fri, 14 Oct 2022 04:49:59 -0700 (PDT)
Received: from localhost (84.125.93.114.dyn.user.ono.com. [84.125.93.114])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003a5f54e3bbbsm7119233wmo.38.2022.10.14.04.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 04:49:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  berrange@redhat.com
Subject: Re: [PATCH v2] migration/channel-block: fix return value for
 qio_channel_block_{readv,writev}
In-Reply-To: <20221013084100.57740-1-f.ebner@proxmox.com> (Fiona Ebner's
 message of "Thu, 13 Oct 2022 10:41:00 +0200")
References: <20221013084100.57740-1-f.ebner@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 14 Oct 2022 13:49:58 +0200
Message-ID: <87czauwro9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fiona Ebner <f.ebner@proxmox.com> wrote:
> in the error case. The documentation in include/io/channel.h states
> that -1 or QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply
> passing along the return value from the bdrv-functions has the
> potential to confuse the call sides. Non-blocking mode is not
> implemented currently, so -1 it is.
>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued in migration tree.


