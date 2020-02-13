Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE115BE98
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 13:43:34 +0100 (CET)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Dq9-0000yn-A1
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 07:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdurrant@gmail.com>) id 1j2Doj-00006I-Tl
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pdurrant@gmail.com>) id 1j2Doi-00069p-Oi
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:42:05 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36207)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pdurrant@gmail.com>) id 1j2Doi-00066Q-J2
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 07:42:04 -0500
Received: by mail-pl1-x643.google.com with SMTP id a6so2312712plm.3
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 04:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZAREPQnfQkqtDBHcsf4dUhi9JqCnyRbJhKQs20vklzU=;
 b=mjbhG91hXKlLt1iBFr0q/4LqTF+sJm3yzGPFfP7oRlmVinzYNFj7FI6hOcB/szuxjE
 6W5t63eC+FMyxMT0Xn+dki9jbiwDgNco0ivgWdKDQtHJSxQhZkw0jWnf0ZbddDy3YCtm
 zURd3qUAUrUxv9iF3jHLbrhlklKM6CcdO858Ilf5CJRxJs6/25pNfygTt0DlAT6V+f67
 v6LyOtjCxTxzbwnRrKS8WW9/H3ibvwi0IJSMxsL3mA8ow4CdPidFDtpU6Ar/jqbAJ9d6
 PTQB1kIR0k57ICxSoVRH7rp6Hy/MWdeApNif6EG0dIPNgyaQV8BUPjs0g9qbEsLWfHph
 Nn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZAREPQnfQkqtDBHcsf4dUhi9JqCnyRbJhKQs20vklzU=;
 b=hSltXQHdo8WIYP4XI/NS9JvqsP8u8PC3z3W9nwAhGRzZUbQiX6wDlRegYdRaM+hVeF
 5nt8ft9KTonShpfnea19Z5Acb/b7JQxQdSTQ3Y3nkbYQUyx97n2mxNcUJ208mlotdxY5
 O//Xx/1tSAqbtaEOkn6sRjBn1oAYxDey1I1skuyXE/LfH5XE1tZGjI2ZmnAMbeYQgcOh
 p2KhX3zPsX2/1Xxo3scTAy1DpD1qzMh3udnt5s1c6R/exz2Kj3K/QVLvQs+ESmIbvDAr
 0qrvOrIk8LDO/vipdOX4Q57o9gAqKkJVs/mPFVGVHwMk+a0M9jn+aAsPHT/5zjG5eYtO
 Vz6w==
X-Gm-Message-State: APjAAAUCckQQc/IJvP7itMkxzxyBYargA7yRxTxCzLNjvnddJrGM5R+f
 wjmYYuEMrHbxZIh/oorsP1a60FEJM7yJ5MuDhQc=
X-Google-Smtp-Source: APXvYqzbIB89rQuhbqhXbUShG2DTMjpwKhgXxhN5tu0+FvKO3FMPYXkITIUh+Pc9Y+G74lG7LqnQRh+cO1IBXXEX0tE=
X-Received: by 2002:a17:902:7004:: with SMTP id
 y4mr13457129plk.263.1581597719813; 
 Thu, 13 Feb 2020 04:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20200212134254.11073-1-david@redhat.com>
 <20200212134254.11073-14-david@redhat.com>
In-Reply-To: <20200212134254.11073-14-david@redhat.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Thu, 13 Feb 2020 13:41:48 +0100
Message-ID: <CACCGGhAubw1jgkAvAOiz05qMzE4ATD=PHzAJruUD4a_XJDfC0A@mail.gmail.com>
Subject: Re: [PATCH v2 fixed 13/16] numa: Teach ram block notifiers about
 resizable ram blocks
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Feb 2020 at 14:44, David Hildenbrand <david@redhat.com> wrote:
>
> We want to actually resize ram blocks (make everything between
> used_length and max_length inaccessible) - however, not all ram block
> notifiers will support that. Let's teach the notifier that ram blocks
> are indeed resizable, but keep using max_size in the existing notifiers.
>
> Supply the max_size when adding and removing ram blocks. Also, notify on
> resizes. Introduce a way to detect if any registered notifier does not
> support resizes - ram_block_notifiers_support_resize() - which we can later
> use to fallback to legacy handling if a registered notifier (esp., SEV and
> HAX) does not support actual resizes.
>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>

