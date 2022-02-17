Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4014B9CB6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:09:41 +0100 (CET)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdjI-00014I-ED
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKdCA-00006V-I3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKdC8-0003n8-E8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645090523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/bE6O/2F59jwNPKlri6mJ+hWKRjzrfY8xyjsj8S1f8=;
 b=VuQcvdpFpuOWmTl0PwGpj29oEyY2DoxsQPTMNwPwNZcrHRKyE6JAqtVcEy+8/Gv2yzWlbK
 kmt4XZP5Ph6HjG9XDrY/YIwCnP04xpkuPxeJPw0hAAulRWErXpcQyxYWPqgphnM0lyyC/m
 3lc4x2GYYx6zGmSbhpT3boHG/VhYqi4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-5QjJzZeGPr-QNuP17GJNeg-1; Thu, 17 Feb 2022 04:35:21 -0500
X-MC-Unique: 5QjJzZeGPr-QNuP17GJNeg-1
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so1252532eje.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 01:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/bE6O/2F59jwNPKlri6mJ+hWKRjzrfY8xyjsj8S1f8=;
 b=4SnC940P2NuJP4OZBR9idvlgS8g17b37xOrrWuriC9ISwEVCZDTKFplYORXBdTjiPR
 zi41IcXYJ5x3EIIDFSReg32CMseCecJ3KuVFmmJGdzpEQObBcIxqbfLzAJpOJkZJqCOy
 ruKdhXQ0Y4L3tdflzmn7NsP71NbAKzM1bMv8810YqWWOm34R+s3p54FgephAqptR4Kmx
 9y7CeuNLLmkI2t+y1Q6zEXz9QCvlDYPjIAWCx2uW4b19EYgvsxIJHikj0RwV90DgICDG
 D9bwqKji0tqBdwv3TLODVud83biXmbGhjzvs87fZyrfnp7wYUn1MYeG6l3/5Jc+mMfAf
 Fm+w==
X-Gm-Message-State: AOAM533Tlfz4AN3e2BFZEJmFo8X7A/CvPYd78X5MnLNyHvbFJaGfPtH8
 fFdQCuu2K2D2fvmvu4bfACXZ+l1Zn/TtykRCkYzKk/enNeSULW3Q6E6yuOYmlkntM4O6up9wEfK
 FlF6ObdL7TAZHIts=
X-Received: by 2002:a05:6402:170e:b0:40b:657:ac3f with SMTP id
 y14-20020a056402170e00b0040b0657ac3fmr1642202edu.354.1645090520603; 
 Thu, 17 Feb 2022 01:35:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZOAgS8yQb+8pMYxJXobdp+aP0S6LpAAz3d4fSkaLA6TeMMur77kBAVjRPx9b3g31KrBGX+g==
X-Received: by 2002:a05:6402:170e:b0:40b:657:ac3f with SMTP id
 y14-20020a056402170e00b0040b0657ac3fmr1642183edu.354.1645090520441; 
 Thu, 17 Feb 2022 01:35:20 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g2sm3057683edb.12.2022.02.17.01.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 01:35:19 -0800 (PST)
Date: Thu, 17 Feb 2022 10:35:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <20220217103518.76f3b03b@redhat.com>
In-Reply-To: <20220217031311-mutt-send-email-mst@kernel.org>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
 <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
 <20220217080852.omqkckc5i2lav7gb@sirius.home.kraxel.org>
 <20220217031311-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, quintela@redhat.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 03:17:04 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 17, 2022 at 09:08:52AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> >   
> > > Other heretic question: Should we maybe get rid of the default machine type
> > > for *all* targets? ... so that we do not continue to run into this issue
> > > again and again and again...  
> > 
> > /me votes "yes".
> > 
> > take care,
> >   Gerd  
> 
> Well originally qemu tried to be friendly and to just create
> a reasonable machine when given a disk, to the point where
> it would even set up some networking by default.
> 
> And I think it's not a bad idea, forcing everyone to specify a bunch of
> boilerplate does not really result in people researching which machine
> type is good for them, people instead just copy paste from a random
> website.
> 
> So maybe we can detect that basic usage somehow (I only have some
> vague ideas) and then set a bunch of defaults that we consider
> best?
or ship with QEMU a wrapper script that does set defaults as
older QEMU used to do. But it will still require user to
change a called binary name, or maybe we can rename QEMU binary
to something else and name wrapper as original QEMU.


