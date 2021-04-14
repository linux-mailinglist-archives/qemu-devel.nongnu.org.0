Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A6B35F476
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:04:04 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfBb-0001Su-ML
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWeiM-0007ds-FL
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWeiH-0005uG-Gp
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618403624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gaeo13zOMgLlAJFcTLb1HzqJZyiVPBH1sOrTOsVlUKY=;
 b=YlRtIbUv2G4ZHgIDpjosOuSaEuFmAsl1YZieXworfL4MSvLwSundF3BOYCLDpc5PBdbrAb
 XFde2TlciED8RZKkDxOZS2aGKIf4hrjRQYDDGjcKstwZrolW9uO4CSE/TXDlZ8SVkU3D+5
 Iu95DGLKCfxBge+WSqBnPdAe0mwE1Ko=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-Iw9asN9QP-y3SWMPp6cxWg-1; Wed, 14 Apr 2021 08:33:42 -0400
X-MC-Unique: Iw9asN9QP-y3SWMPp6cxWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so1014054wrm.23
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 05:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gaeo13zOMgLlAJFcTLb1HzqJZyiVPBH1sOrTOsVlUKY=;
 b=LQZ45IyDinfmPkg1S/1IBmxJkLelec94HDH/HrZwiTOtKjPZV7bF2pA9JROSnyopXl
 cxklGt+hDTi5MZpUqhfhozCCYJBDSlNe+kwmSroKXO9HGqb8hHGFLuBF42ijImNbgEjX
 SLuL0WMYKAwTrbIVieUozihP2obf47rDvn9GIUQpbd/UV+JHhuvW38jZQAAON1hYLGWO
 PF7xJ71DgQImjUFPUhBBmvafE/GGiS23CtqpwO9QUWLqFKlpu+iFr3rriYW58iQnG/CM
 qGblqyYfRKPK6z1YDLXs4SzDExC3H1MmmQo+WDC0qJgkLE9ToB64RVKizfOJBbYIZdjG
 zr1w==
X-Gm-Message-State: AOAM533lHy+tk1pPw/oJeOE+UjYkuB+wneO7rz14TbGfWJOxy2lXobtm
 +HJsPjhyEEMV2BpUEke0lEVuGPYCOoKlBFnB1wLiC2cCW8Tgwfmv7qX2z8Ue/QEsthCo1l7wmh5
 PjspuvAh5lZ6IqPs=
X-Received: by 2002:a5d:5291:: with SMTP id c17mr43401411wrv.110.1618403621261; 
 Wed, 14 Apr 2021 05:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzskX7AGlVUT6jAML+nVaAFLa/PrlKoHhu5a7HR7HxkmsDcwD71X1IfCkTU39RzdO3zYs8JUw==
X-Received: by 2002:a5d:5291:: with SMTP id c17mr43401386wrv.110.1618403621107; 
 Wed, 14 Apr 2021 05:33:41 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n125sm5345452wme.46.2021.04.14.05.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 05:33:40 -0700 (PDT)
Subject: Re: [PATCH for-6.1 2/4] migration: Move populate_vfio_info() into a
 separate file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210414112004.943383-1-thuth@redhat.com>
 <20210414112004.943383-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a00471b2-857f-b8ae-963a-8ec601614428@redhat.com>
Date: Wed, 14 Apr 2021 14:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414112004.943383-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:20 PM, Thomas Huth wrote:
> The CONFIG_VFIO switch only works in target specific code. Since
> migration/migration.c is common code, the #ifdef does not have
> the intended behavior here. Move the related code to a separate
> file now which gets compiled via specific_ss instead.
> 
> Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in Migration stats")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  migration/meson.build |  3 ++-
>  migration/migration.c | 15 ---------------
>  migration/migration.h |  2 ++
>  migration/target.c    | 25 +++++++++++++++++++++++++
>  4 files changed, 29 insertions(+), 16 deletions(-)
>  create mode 100644 migration/target.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


