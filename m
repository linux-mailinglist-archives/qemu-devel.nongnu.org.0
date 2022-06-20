Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E394551956
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 14:50:43 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Gra-0006FU-4q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 08:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Gn1-0002NT-Cw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3Gmy-00057j-2x
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 08:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655729155;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnjbwZnj5Pu5dgvRWIvNep3MzZyRIE0F3Su4OBFBblI=;
 b=G2S8I4hTjXI3HVykitKQXT1aazhe0V5KynuqdPW5r8iwFwVxdj4r5lXz2KGAERNW5Dm3Bc
 ZSOczxGCNhi+ZZyujKPOviz5Bi12GoD6b4bf8zH+mBGdgnYmnaHCnafiQ4GUQjQPVYSr2u
 KM+LOCl0W1ZehJgeC23pZPRDVnOEYbU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-nz1ZpUfIM6qFcY8FmGOvng-1; Mon, 20 Jun 2022 08:45:54 -0400
X-MC-Unique: nz1ZpUfIM6qFcY8FmGOvng-1
Received: by mail-wm1-f71.google.com with SMTP id
 i188-20020a1c3bc5000000b0039db971c6d9so5568674wma.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnjbwZnj5Pu5dgvRWIvNep3MzZyRIE0F3Su4OBFBblI=;
 b=cFvTNJca9I4LN4SZl1EJfwfEbqYUilgFFwJLmBUnZjbxUnh7Zqo9PUtYm+nU8px/Fh
 Oge0oPUOlFjaNgGjGlE9Ura4Z3q8g4tvISoRqfY1j6qoUAqeZHLOgMJ6mEhPesMSLpG5
 39cStFps19t9AlrcE22mEhWoKtDqUa7mDsmrubDB9+pdtEysJ7ZLTVySX6LkTGj2lNcW
 wbEyoQTrJiQ3SCbXNOSGDRypRpSDvWKveuRDvwwqX4t3zd2umuyNoC6C84DVomkhKIc9
 3N5XPrdw4fgXXCWPPxBuC9AQRw0nxsRWtBLVVVAKe6gn2xk6pBDmJxG7FRQUYcO4I9cO
 rCdQ==
X-Gm-Message-State: AOAM5300DKRjuyX688Rc9kXWfv0AWi5ZBDKK1wF3EjViJpD4tWVW9ygP
 W+ln6Nl8izLcjbahrsTR0eENW0rZrZ1qajZqOZZFVf2CKw4PG7aMGxAh1VBKiDrfDda30tTObwn
 PSgJ3UKSLRkLVAjk=
X-Received: by 2002:a05:600c:22c6:b0:39c:4746:904e with SMTP id
 6-20020a05600c22c600b0039c4746904emr35169418wmg.93.1655729153184; 
 Mon, 20 Jun 2022 05:45:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn9IzN3TBXuM/fNSFJxpqnPAN1axk9VsM8IEhx80PfTKx7FIjiP0F4eEHV4prHAHfFXqEO5Q==
X-Received: by 2002:a05:600c:22c6:b0:39c:4746:904e with SMTP id
 6-20020a05600c22c600b0039c4746904emr35169395wmg.93.1655729152999; 
 Mon, 20 Jun 2022 05:45:52 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003973b9d0447sm24262127wmq.36.2022.06.20.05.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 05:45:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 02/21] migration: switch to use QIOChannelNull for
 dummy channel
In-Reply-To: <20220620110205.1357829-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:46
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-3-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 14:45:51 +0200
Message-ID: <87bkun4i68.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This removes one further custom impl of QEMUFile, in favour of a
> QIOChannel based impl.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


