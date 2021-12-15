Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B74753C9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:36:40 +0100 (CET)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOq5-0002s1-7l
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxObY-0004wf-4p
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mxObQ-0002pa-Or
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639552886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfKUiKIrKlATVhLATr46Wb1H+SsUnGAwCFVp+AZe/Mw=;
 b=JRWqZDvlNXmT1CPFsXDRXvpF+HfBCAScwxJj2IMPbDqFob41IWwAt22YyUYHtl5HhkXOSS
 EfOONJso0N6eSc8rV5Yst23E0g07IAvmffEe6CzT/zHC0bU34rgbLaLqi1S6qNUa2kB/Fd
 JLZfPJi1gOrRcOGb+pV0a3c+cNPxEU0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-E1ay59iBPe-xiQyklWTwag-1; Wed, 15 Dec 2021 02:21:25 -0500
X-MC-Unique: E1ay59iBPe-xiQyklWTwag-1
Received: by mail-ed1-f71.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso19270029edq.19
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 23:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jfKUiKIrKlATVhLATr46Wb1H+SsUnGAwCFVp+AZe/Mw=;
 b=qNfZO5zlXtZRsBby75dHagZVdkMlOagL43R8QFn2s+F6+T1oBBws9bsOwgIW/S1RMJ
 6VG/mBPwtYWQTro3zLTPRoKYDr/yebIYUyXtTJlzu1XzV+MWD/APMbL1rt/JpUAyq4Sv
 NQP+VaUPTn06vLm/9o6CYpO8rW9ymM/xVSIGoYldXbwyq03BerpWbMt8GEc5nhveqDkn
 vj7KdLHkgnNKUmn7gfl5oFxWvdtvKvsRYQRTjCWifFBPhEWVgj6mRNQwz2npEM8AB+6s
 pM7dG37FqOXaqMZzKe+buRyYgfPKeLixtw/8DEwFAZXBceuYludu2o3NQ7mQLKiNKbEp
 OyFg==
X-Gm-Message-State: AOAM531bIC2AZVATZh7wJejaDKD8nfgCwiCFAIZLgqr9ZtUiEjKx4k4I
 59H08Aq/i0Jsn7WuDkax1ISXX6iIphyowtlBzaNRD9QPIZoZQ5vFY1VDUJk2E/7703xl8lFVYo9
 QwCkeYrJzWazm1Ik=
X-Received: by 2002:a17:906:9258:: with SMTP id
 c24mr4249314ejx.473.1639552884362; 
 Tue, 14 Dec 2021 23:21:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYk1r4B11qjFJPH6gyowd4t2+MoqhMeoNm664H/PvNm46A+QXkl2B0/HKqtREnvFG4r9oeGQ==
X-Received: by 2002:a17:906:9258:: with SMTP id
 c24mr4249297ejx.473.1639552884093; 
 Tue, 14 Dec 2021 23:21:24 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207d:b04b:8335:12e0:5819:f7df])
 by smtp.gmail.com with ESMTPSA id do16sm332949ejc.223.2021.12.14.23.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 23:21:23 -0800 (PST)
Date: Wed, 15 Dec 2021 02:21:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
Message-ID: <20211215022039-mutt-send-email-mst@kernel.org>
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
 <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
 <f30cf42d-30e9-4529-6531-1ef9d236005a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f30cf42d-30e9-4529-6531-1ef9d236005a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Sosedkin <asosedkin@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-discuss@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 08:03:50AM +0100, Thomas Huth wrote:
> So if changing netdev parameters on the fly is something that we want, we
> should implement this properly instead indeed, and not via such an
> accidental bug.

How to do it is a separate thing, users don't really care at all.

-- 
MST


