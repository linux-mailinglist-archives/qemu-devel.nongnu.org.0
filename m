Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A380B3D010E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:57:43 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tzy-0001I5-Ld
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5tyI-0008Jv-Uo
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5tyE-0003CH-Nq
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlsqTWiblUC7YYUqIWq3ZMEPXvxhrYu1DQHdQfjZSYY=;
 b=U/LxUNFfVYRldKgDBSQtHLxx+PYc7TZ76/Nf568eQppL6Ku886MOGYUB+7+S+UXSEDBGa8
 vY/qsA3D59CkwipOB/AerA2sza55s44syuFO+20LtJUNPngdMFIgh4IwdQqZ68ikQQOwYQ
 dxfEtRrLVJYU1xrHV73zVFgm6NO/8cA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-158mtjndPceyZJfVWCITfw-1; Tue, 20 Jul 2021 13:55:51 -0400
X-MC-Unique: 158mtjndPceyZJfVWCITfw-1
Received: by mail-qt1-f200.google.com with SMTP id
 j15-20020ac84c8f0000b0290257b7db4a28so132092qtv.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OlsqTWiblUC7YYUqIWq3ZMEPXvxhrYu1DQHdQfjZSYY=;
 b=WlbT9T0P4hzdonCoeGnW47Y92Vj7/OMUglWMTnfgquB3VNE2VPKe8sLkD1Pdl77vLz
 jVlO3PgBxrFMEfmBCFhyk90mLv6C+GxQwBVChXSeCFR0x9/VG8f7ZVfUUKcgBnSNnYAr
 y9zaNjNdxS9aV/NQnUoALmmNIbGkQ6KHvskJ2uKwREm/W3dCQehKoJUuO6ZW2dy0o/Tm
 gRrTDO+22TrSvJ3ydk1AOnnlynRS1A3zIxn/BxvOV+hYg0AIT9bhAYxIlc/i+MzbJqcn
 9Ct8O23Iq7T98HazBPvcchVqkszEdXgmoDLwf+lzmzhThjtHrZv3BuMDv2e9c5j42pJa
 umZg==
X-Gm-Message-State: AOAM532nFG2nCx7s72kTdyVMzmToUl6LPdvEh7IXMgrpVzAlJYUqaWFc
 pglv6hZcvGL5UbaqL91kqilom6jOFACNKA4x1d7hSMMVJwzg5mSRQ8qFP+hBaAsXxOeQIYvhMoI
 lxVE+4WHZRqlV5LA=
X-Received: by 2002:a05:6214:e83:: with SMTP id
 hf3mr3886918qvb.19.1626803750565; 
 Tue, 20 Jul 2021 10:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkA0/l/aMORUNvVReWU+aD242eHIVA+ixEhvyqFPJ67Zx1pOG0vnC0AJtcJ+tMs4Ki7jMzbA==
X-Received: by 2002:a05:6214:e83:: with SMTP id
 hf3mr3886893qvb.19.1626803750301; 
 Tue, 20 Jul 2021 10:55:50 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 141sm2125150qki.15.2021.07.20.10.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 10:55:49 -0700 (PDT)
Date: Tue, 20 Jul 2021 13:55:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 01/16] error: Use error_fatal to simplify obvious fatal
 errors (again)
Message-ID: <YPcOJGwPd8XYbuuc@t490s>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:53:53PM +0200, Markus Armbruster wrote:
> We did this with scripts/coccinelle/use-error_fatal.cocci before, in
> commit 50beeb68094 and 007b06578ab.  This commit cleans up rarer
> variations that don't seem worth matching with Coccinelle.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


