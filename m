Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBCD552027
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:17:36 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3J9j-00021h-FH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J5m-0007D6-NM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J5i-0000Ag-NP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQXwM0LyqoOoHW0IdpOYKBIXuomh8FCPXnB70hl9A4A=;
 b=JzrKh8Nq6MOcAJ+S05W3w2JuH/tfayslqanCiczY2cO5SdKS4Olr7G53KAC4zYfaE7P49E
 6KQVUTSO426zXVc+nPhKOY53y3S2jah34dzG+nh1nih5a15wt+jWYpCktDxurMVFGV+c24
 k0eWTGf1TmrJcHK4Pq0bO9V7UOpHh+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-KxkpFyOEPOq51q8Gz1boNQ-1; Mon, 20 Jun 2022 11:13:23 -0400
X-MC-Unique: KxkpFyOEPOq51q8Gz1boNQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so5123235wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VQXwM0LyqoOoHW0IdpOYKBIXuomh8FCPXnB70hl9A4A=;
 b=AfIEMxOmRrVgh220NSPA2pCNtYZDM+8WwhnS7JCm2IrBKoaqxfS1PRF8xwNq+R60o5
 R+FUODrG+5hI6slYWKN4ruS395Y77X8IMu2yzPu7+s3oUfTv/h1w63EeZZOTDJB2Lh+v
 4zCdpVkS3uIBvz24OTCMxqV1Z3xEuZdKcYJzdJyUk0jjKYnBLo4eCpNREEy8bU894PVi
 A/+168W04gMdSZMyhF1tU0j3gFSCDg+jRvLsJUrri2kOA3WcnBv7h3azx/VX8aYG9XE0
 Y1MI2cfFEhv79DgDuWnK3nthjyE/2u/xc6UxWZUMWQdSOazHeZytkpdINubFpFaSDxhl
 d3aw==
X-Gm-Message-State: AJIora+N3rdqrmN1Kg/jsaU1fhiVmZhWejJLehhlk7SlhR6mSnI8h2F7
 HT0DyrmZ1sLKTppnPzNKcHUBHZD9DCnzNhIPRwYM41J7Y3fWvCqmRhzaI47wnYfa0OzJQejMSGb
 UZssbNpv+8D87XE4=
X-Received: by 2002:a05:6000:156d:b0:210:3135:ce1c with SMTP id
 13-20020a056000156d00b002103135ce1cmr24141157wrz.409.1655738002186; 
 Mon, 20 Jun 2022 08:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyreGhr63QsbywQd23w+JV+/gAarm8NTaVQK7QlFfzvi9dOEe5Ta7Lb6AV6jzAJ1uALsaNpQ==
X-Received: by 2002:a05:6000:156d:b0:210:3135:ce1c with SMTP id
 13-20020a056000156d00b002103135ce1cmr24141132wrz.409.1655738001974; 
 Mon, 20 Jun 2022 08:13:21 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b0020c5253d907sm13602337wri.83.2022.06.20.08.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:13:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 06/21] migration: rename qemu_ftell to
 qemu_file_total_transferred
In-Reply-To: <20220620110205.1357829-7-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:50
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-7-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:13:20 +0200
Message-ID: <87pmj32wrz.fsf@secure.mitica>
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
> The name 'ftell' gives the misleading impression that the QEMUFile
> objects are seekable. This is not the case, as in general we just
> have an opaque stream. The users of this method are only interested
> in the total bytes processed. This switches to a new name that
> reflects the intended usage.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


