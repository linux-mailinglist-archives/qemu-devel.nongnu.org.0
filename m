Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A43F780C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:11:10 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIuYS-0007hH-Ek
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuXT-0006xd-A2
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mIuXR-0002JR-Qo
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629904201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cmbhe77XRtg4cX46ngzHE5S6e+E4IqRgTKUjm4ZoPlA=;
 b=UWWLNa+FddKeJcYJea1fFj616nZn2REMNiaw5isteCJgNNROaSj8X698/bcYCjHi+gG6Bx
 y5V8vwObASKRSYTH7trCIlCZqwuhijy85x2+2NCThHPjNhAoVLwSQ4FKVjZbgpab7MGQek
 8JdUWS6Sp6EXfoJnHySmCHjRx93rCXA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-8_t36PHBNZSwJKm_C0kZlg-1; Wed, 25 Aug 2021 11:09:57 -0400
X-MC-Unique: 8_t36PHBNZSwJKm_C0kZlg-1
Received: by mail-wr1-f72.google.com with SMTP id
 a13-20020adfed0d000000b00156fd70137aso6625144wro.8
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 08:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=cmbhe77XRtg4cX46ngzHE5S6e+E4IqRgTKUjm4ZoPlA=;
 b=EExQlItP6xDS7olsXJPOlZENub7e9qCINw6Bt9Bg09zr6rZZZL5fITUCHQnXgq2Tcl
 7VoolxYm38wdvTiK95EkDkUfqHZWoY5R/SSqvKsKbQdPHYIqoDZ8M6ed1Zts6/ofMk5j
 mz78YtDHe9nsMeNDhAYEktRdVZ9JvkHAwpp/1wYnFmZ89Gfc3OtX2DonQwtIsJ+YDiJS
 vgZn5wt1MRndFYKjJcgXMFjKZRhScb5sJmytPJHePzZeFsAQE9iUFCur9/AzrDKlIh8J
 dsI85BbVeTiG01XtA4aL6uD5VkmmdUtgh0xUgY9zfyBp5XjbA88ztg1YMLUNuCQ+T7yg
 0P8w==
X-Gm-Message-State: AOAM530rG4YYpeU1u5Mtmd1gSY+vyQHux8XWghsks3zoq5u4pXMhmxaf
 YndUbFyIzptjzYoI2aSPcCT5Bkj2fRq+o8hp/oe2igTfEvO6BrWnDNEYvs+J0Ap+aEiYd0LEH5o
 fPz8UyMkFc6ngHdQ=
X-Received: by 2002:adf:808e:: with SMTP id 14mr2717939wrl.339.1629904196514; 
 Wed, 25 Aug 2021 08:09:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrGrF9fA7FDKvSsVGZpPqhAPyPhSSV8N/TF6lg/60l6HjCDk8Vy8J513bgmpjC1DPJFFMFtw==
X-Received: by 2002:adf:808e:: with SMTP id 14mr2717911wrl.339.1629904196308; 
 Wed, 25 Aug 2021 08:09:56 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id f17sm176158wrt.63.2021.08.25.08.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 08:09:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v2 3/8] failover: virtio-net: remove
 failover_primary_hidden flag
In-Reply-To: <20210820142002.152994-4-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 20 Aug 2021 16:19:57 +0200")
References: <20210820142002.152994-1-lvivier@redhat.com>
 <20210820142002.152994-4-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 25 Aug 2021 17:09:54 +0200
Message-ID: <87ilzt4l31.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> We dont't need a flag to know if the primary device must be hidden, we
> can rely on the machine state:
> Device is hidden if the machine is in prelaunch state (src) or
> in inmigrate state with migration status set to none (dst).
> We don't need to check the flag in virtio_net_handle_migration_primary()
> because this function is only registered if the failover is enabled
> and the flag also set to false. This function also sets it back to
> true after a successful unplug during the migration but we don't
> need to know it is hidden because nothing will try to plug it back
> after the migration (except in case of error but the flag is set
> back to false).
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


Much clear.  I was removing all the global failover variables, but
didn't finish the job.

Well done.


