Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205491F4522
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 20:12:22 +0200 (CEST)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiijV-00082C-3w
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 14:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiihg-0006ai-J6
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:10:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29096
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiihf-0003Ra-Ou
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 14:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591726226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81Jnl2YhIy9XT31dGbKxbPeahoC1MbvPHKpzXsvBMnU=;
 b=T6XKqEGO8HSeX/EdojwQ6vLz7inKBl5PgfuOyCTg4Aig9d0O4ghLpFx7lzzG/PEnTwhS2O
 5doPYIK0msEls0WydYEscqzpMGa/RexsEanAEFkV7PSuqLsMtIMmDqXKmlZfP+zeosOic4
 0M81wZ8Lab7QyLtCE63hhAONggKHwPs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-gTxJBtYHPyiefBLSsSrKzg-1; Tue, 09 Jun 2020 14:10:25 -0400
X-MC-Unique: gTxJBtYHPyiefBLSsSrKzg-1
Received: by mail-wr1-f70.google.com with SMTP id o1so8866342wrm.17
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 11:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gJ9NwEkbeqR+ds6kYcvnZNTG1kXNCaz2G3s5mt5k7Ws=;
 b=kGTzSCHFVC2XvDqg155FDeQx6rfTptQAq3Y9hnGgQtvkWMGpBfrLaD26fqnaq9zcfC
 zrps/5RdXEMT+8x6i3OkHDuOP7y1R0iYW6zvrscd+nGToHN5vMDABbU0Bb7KUVCD790I
 VN4MUw8nx7M3AilyJH4QeDzSE9R2akgvAeQO4xZxSeTNrdg3QhzoUm1m7B15DsUD9Fnd
 EfKKgDTqGg3CRmGuovn9Fmcyvw0DQGUPKrPx9pYklnuKL+XEBJYklT6OWNQ+lRRtaEk1
 oBtDcb7KMoyBqK0jOENXQLbTcrBVOcSectaUo+QKumT5LYmhN0CZrKhG70pYHB/73mVI
 v1EQ==
X-Gm-Message-State: AOAM531dNVmoI7cjOMCJzm3wjrO1/I3Lmfdc6dLM37ll2J03y1urNfZD
 /vaKB0H+/JsImq/T9ewx8oilRwuEhDkQoXu+KAr5RuKBnFxJa6sS+l56OvYUeSqiW5vOCqIhZGg
 FrbiXMdp+gtGlJCA=
X-Received: by 2002:adf:b697:: with SMTP id j23mr6232451wre.201.1591726164397; 
 Tue, 09 Jun 2020 11:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3wIFTJlqJ0Exx4SQw8f1c3OY+n8STBLo2VVethM0M5nn7VlWNSLGx9ufqMA+ERtgIFJp/NA==
X-Received: by 2002:adf:b697:: with SMTP id j23mr6232429wre.201.1591726164216; 
 Tue, 09 Jun 2020 11:09:24 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id o10sm4183793wrq.40.2020.06.09.11.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 11:09:23 -0700 (PDT)
Date: Tue, 9 Jun 2020 14:09:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] pci: Display PCI IRQ pin in "info pci"
Message-ID: <20200609140909-mutt-send-email-mst@kernel.org>
References: <20200317195908.283800-1-peterx@redhat.com>
 <6beb4b5d-91c6-2536-64ab-18217be71134@redhat.com>
 <20200317201153.GB233068@xz-x1>
 <2847e5da-4cc3-8273-f51f-86b0995943de@redhat.com>
 <20200609114913-mutt-send-email-mst@kernel.org>
 <20200609161328.GB3061@xz-x1>
 <f4faa7cf-1bb3-6381-05e0-64f01eb377cc@redhat.com>
 <20200609175355.GD3061@xz-x1>
MIME-Version: 1.0
In-Reply-To: <20200609175355.GD3061@xz-x1>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 09, 2020 at 01:53:55PM -0400, Peter Xu wrote:
> On Tue, Jun 09, 2020 at 06:18:15PM +0200, Philippe Mathieu-Daudé wrote:
> > No problem!
> 
> Thanks!

OK so any chance of an ack?

> -- 
> Peter Xu


