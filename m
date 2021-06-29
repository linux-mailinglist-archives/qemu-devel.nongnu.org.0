Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6753B775D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:44:51 +0200 (CEST)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHn0-0005uu-4t
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHlS-00058k-JQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHlQ-0004Wb-W5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624988591;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LDRVWxKBMqqARaVm12XdNM+AmH1lo944nq9JrAez+bY=;
 b=GvrKl0s7l3rjx2K7lVoLP4vTYvBRcO9wfIgxsX8Aajrj54cCxpB5upCMHiPc0o+0SQWh5R
 pj801CtdTqFuwtQYDSm1NaOVfzy3YDJS7O213XszjgFHq6yMAJ3553M0LMvQODNplrk3o/
 LLdVStfI8iO01FrgaL1h3Byp2VFXl9Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-V1Pm6Mc-NgWnkolGXWkeag-1; Tue, 29 Jun 2021 13:43:07 -0400
X-MC-Unique: V1Pm6Mc-NgWnkolGXWkeag-1
Received: by mail-wm1-f72.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso1585542wmg.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LDRVWxKBMqqARaVm12XdNM+AmH1lo944nq9JrAez+bY=;
 b=GroxefGgsKCuzjaH6GrGufQe4XOF1A4IhD4+OBF4UiBDibI+z1u7XVHaQ4fz3R8ffu
 agSqoie2sGBl8XURyh0UMgl0EXN/Pn0Oi7VyfXBRQVlrTcZvY+qqMS+y6YPd1b2awf96
 MPkCnkzxRy1bdSGQLoz5LnX+74Q3kctOjG8Xe2XP+Q9FhW5xLDcZLDwPFe/e3FVEVb8c
 y5f0LVwkVPeOX7n7haXXpJofRqAB06ywXebv5emrwAOkIcAAwnqrRWC3acQd65l9FuyI
 Y4KKgO18T+9ONNtInPXSplyNGCeQ43LfkKRF1WtNPN2j/F2Ps6DBmAAd9igkZVXbFH7N
 lJ8g==
X-Gm-Message-State: AOAM533IPG0IJdqdFlfXB/iqJCsXcyNqWWpxtIf5mppvTkRPL3GAi5wB
 FZjfElpHyN+uP6iWHc20mSD6ZldPftMXsSRXIgp0q0hC8f1FlxDFlhO+4g5d9qG7xB7iQ1ls9Zr
 QXoFxgCMTG++XsHA=
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr34628147wrx.7.1624988585609; 
 Tue, 29 Jun 2021 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW1RKj/VqKQdAOKrz9XqRkhybLChc/Ii4OiYKcE0AMlnYs9P7i9U1z712IVQFmpmLXtZDkqQ==
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr34628117wrx.7.1624988585329; 
 Tue, 29 Jun 2021 10:43:05 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id l15sm19090363wrt.47.2021.06.29.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:43:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] migration: failover: reset partially_hotplugged
In-Reply-To: <20210629152937.619193-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 29 Jun 2021 17:29:37 +0200")
References: <20210629152937.619193-1-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 29 Jun 2021 19:43:03 +0200
Message-ID: <87r1gkk1nc.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> When the card is plugged back, reset the partially_hotplugged flag to false
>
> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1787194
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/net/virtio-net.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index bd7958b9f0ee..16d20cdee52a 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3234,6 +3234,7 @@ static bool failover_replug_primary(VirtIONet *n, DeviceState *dev,
>          }
>          hotplug_handler_plug(hotplug_ctrl, dev, &err);
>      }
> +    pdev->partially_hotplugged = false;
>  
>  out:
>      error_propagate(errp, err);

Reviewed-by: Juan Quintela <quintela@redhat.com>


But while we are at this:
- In case hotplug_handler_pre_plug() fails, we don't reset it.
  No, I have no clue what is the right thing to in that error case.
  We have already plugged it once, so it should work (famous last
  words).

- Independent of this patch, we check if hotplug_ctrl is NULL, but
  nothing else on the tree check for that.
  Ok, device_set_realize() check it, but nothing else, except network
  failover.  I can't see how we are going to be able to arrive there and
  not having it, though.

Later, Juan.




