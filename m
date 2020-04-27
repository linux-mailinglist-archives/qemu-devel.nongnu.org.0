Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146341BA7A3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 17:15:05 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT5TM-0001rr-1V
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 11:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jT5QC-0004Iq-Ak
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jT5QB-0002xi-Sv
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:11:48 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:42025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jT5QB-0002xS-GL
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:11:47 -0400
Received: by mail-io1-xd42.google.com with SMTP id e9so19173455iok.9
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcZG6Ua2YjKcJWAI8eK41V1e/6I4QwQkwHLFwjvdX14=;
 b=T+4eAOXzI8beWUoU+VJv/mMjvQawp6KG2MVYvugpZnBN+bHWx/Abqzc3v9m1hIeBlC
 Ng8BOc9n6/VEOoYzk4Xb0SZDKe8Nzorp4NkjYKk3Ca3byqzbvS3ohXAraXgT6g4r4x+e
 TEVrhTkVra0130GQa7EKOSPVFseIm1iV6qbTqYZ4aF4HWUDjJxuRs2+U586w5P9RdDJo
 CvfbhO343hUioSFTI5/YM9UgYxZUFEoEFNxFWc9q3x0B8RawJkxyjMD7ZXB1RQjcaA5f
 Tdq5MJKHZyvC2uW+z1X1jSuJEdKEfNo/sNMYfcKUH36g7efcBjaERH+jodafQBEsvmdn
 Clpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcZG6Ua2YjKcJWAI8eK41V1e/6I4QwQkwHLFwjvdX14=;
 b=Ai1LUtw94fHLYyXPZ9b0Bsyj3i8CLvVnrwtBFjxn0C+FkVqv8Wi2T5QuLj8ZwoqVRB
 Fmms5IRMZhJGYGUu5kipShirrcySBlI+TqKCnQNdIaxfJXkZ23zrFvrlT+y8SP3llioU
 Ij+gPckVh50VjQuUET8wl2emQD3bDpt+9AkIMst2YDkq8JByaRSKQGSTuZuQwOPhViv5
 RioOD7sacxziiCHCuto4y+E3Um05m42YscgH9RuC3HvTXjazeMGKt5GxwCsIOajR+ZV6
 cYrQjXtuh0hMWPjcwBWyAnQpLqCh0qlxRIJKurcyOv5Q7jNRVufgJazsnzIyANwr+FAI
 vPKg==
X-Gm-Message-State: AGi0PuaZdYy/1JgtNebge53kqx9LT7BHTCHH3v3DixF9pyHwfS1xwvnp
 TNv72TGtYqQF57YTmTAvq7OG1o9ZClg7Zjw8L1w=
X-Google-Smtp-Source: APiQypINn0ZS0dKLsqVrtKaVzzpTvtkL8NLUeqNpb5vO5p4PBRq483gxx+04yJS7PBMQs3iH490P8znQZKM4PNz7qOY=
X-Received: by 2002:a05:6638:103c:: with SMTP id
 n28mr19877662jan.114.1588000306420; 
 Mon, 27 Apr 2020 08:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200424164239.10723.58352.stgit@localhost.localdomain>
 <24b5a6e2-0062-4d73-db9d-2c811c7b7751@redhat.com>
In-Reply-To: <24b5a6e2-0062-4d73-db9d-2c811c7b7751@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 27 Apr 2020 08:11:35 -0700
Message-ID: <CAKgT0Ue6X7fRjgmO_1JKdRQ35oCkpkFzCptoOVB0DTUUcu+a5w@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v22 QEMU 0/5] virtio-balloon: add support
 for page poison reporting and free page reporting
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 27, 2020 at 1:21 AM David Hildenbrand <david@redhat.com> wrote:
>
> Except one minor nit, looks good to me. We'll have to take care of
> compat handling regarding patch #4 as soon as we have 5.0 compat
> machines in place.

I will clean up the one comment and submit later today if there is no
other follow-up.

Thanks.

- Alex

