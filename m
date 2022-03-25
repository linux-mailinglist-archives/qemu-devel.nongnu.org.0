Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE404E6F84
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 09:37:07 +0100 (CET)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXfRS-0007pZ-5c
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 04:37:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXfP8-0006lx-CN
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXfP5-0004h1-H5
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 04:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648197278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WrdyQb+Uv/9WNCCF+/twDW82DyGh5taXBM+hU8QrQjU=;
 b=G13UsxorlXqmpZ4PHnHy2S2gm2wDVakLQX1qexIG0xnnpyAN6I6RSvIuCnqiwYP1SN0JFV
 v7TKZcQ4FyBnC6BaSLJanf4SUnhXkE+B3qHC3Ye6Q3u2pu5GeY3c5LBCUGdPO1tSTvfH5f
 V5B3E1pO836KOJMzfWll2BPWo0Gb1Sw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-xQf-_uNvNMO75kpJPFnbow-1; Fri, 25 Mar 2022 04:34:37 -0400
X-MC-Unique: xQf-_uNvNMO75kpJPFnbow-1
Received: by mail-wm1-f72.google.com with SMTP id
 l7-20020a05600c1d0700b0038c9c48f1e7so4945421wms.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 01:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WrdyQb+Uv/9WNCCF+/twDW82DyGh5taXBM+hU8QrQjU=;
 b=Weprr8yl65xL6jQOoI0C04/uGWW1+NfK4+71raf1JFbvyU3zUR8hgZcrN1PUJ6qLh4
 kiLA2Ccc9JDzUOqRW1zm+g5CdWx604ysMyrA7OYvpn7IPxhtoOJ7/l6/T+22mn2PVlbI
 e2j0+Rk+ZwmHGoENaqlM2C6h6wmvb2Q51Le3TI1NxyKPkwZ4BO6bJvgKivwRPOyH1Q41
 kUNMHYMw/EzmRRjRRkCb+hUhTmsYfNnLYb5APFuT/Kg4KUdSrPDh2DyOWYi7KplCgWWe
 cxr/Z5u5RBcgUYudcZ0Qz8mbmMe+U5vWIzG4ren6iJ3maKK36su8ifND6akwp+U0//gV
 dtjw==
X-Gm-Message-State: AOAM532dNVJynDIdGlBr1k4rvNthWhqrIJATvSP/9X4441VOdf1/0VRm
 ikQYg/ufNAnn5Crf3aBe98MjesDetlOQXA+BYpom8M8al55zH9HTXaL9CJAWx3ChSK1/BJcepHD
 +i2M8NXmfC3G5Rx4=
X-Received: by 2002:a05:600c:35cc:b0:38c:6d25:f4ad with SMTP id
 r12-20020a05600c35cc00b0038c6d25f4admr8589647wmq.127.1648197276070; 
 Fri, 25 Mar 2022 01:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9JSpWRk2LRgPXv74WxLi/tJwLkB8FqTAgxuuKq0EB245CfQf7Z1SW9Vl2nq04SgzY/fLhZw==
X-Received: by 2002:a05:600c:35cc:b0:38c:6d25:f4ad with SMTP id
 r12-20020a05600c35cc00b0038c6d25f4admr8589572wmq.127.1648197275657; 
 Fri, 25 Mar 2022 01:34:35 -0700 (PDT)
Received: from localhost ([47.63.10.52]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm4828654wri.105.2022.03.25.01.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 01:34:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 11/32] Replace qemu_real_host_page variables with
 inlined functions
In-Reply-To: <20220323155743.1585078-12-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:22 +0400")
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-12-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 25 Mar 2022 09:34:33 +0100
Message-ID: <87k0cie8h2.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yanan Wang <wangyanan55@huawei.com>,
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Denis V.
 Lunev" <den@openvz.org>, Warner Losh <imp@bsdimp.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Stefan Weil <sw@weilnetz.de>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:S390
 general arch..." <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:New World mac99" <qemu-ppc@nongnu.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace the global variables with inlined helper functions. getpagesize()=
 is very
> likely annotated with a "const" function attribute (at least with glibc),=
 and thus
> optimization should apply even better.
>
> This avoids the need for a constructor initialization too.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I see what you are tyring to do here.

But once here, why aren't we just calling getpagesize() and call it a
day?  I can't see what advantage has to have this other name for this
function, and as you are already changing all its uses anyways.

Once there, I can see that qemu_real_host_page_mask is used (almost)
everywhere as (vfio code use the real value):

    foo & qemu_real_host_page_mask()

or

    foo & ~qemu_real_host_page_mask()

And no, I don't have any good names for this macros.

Anyways, if you don't like the suggestion, your changes are better that
we already have, so ...

Reviewed-by: Juan Quintela <quintela@redhat.com>


