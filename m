Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD664A4BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:27:50 +0100 (CET)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZWv-0003l6-SI
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEZ5E-0004MX-DH
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEZ5C-0004Ap-Kz
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 10:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643644750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjMHoVlehjoyXWpnOv/NbqHJ7jV0xeOV5EsUpJGXymM=;
 b=BifS5XEDKjAhkjNZiyOL1e1f152oRUy+OqbTMcvt0YqpAQiyesUc+OcmpuIO81fQNXhYRq
 y1E7nL3QjtQYqXApNc0r7rX+jt2Q/57haK1Wzs3haTb2alb4IQZS5PQc/pqpzS2wp9VTsy
 uWpCsdHmn22QF4y2c2UXTXsDU7If+9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-7Xg3C3HNN9u4jFZAUGAT_Q-1; Mon, 31 Jan 2022 10:59:06 -0500
X-MC-Unique: 7Xg3C3HNN9u4jFZAUGAT_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF211018722;
 Mon, 31 Jan 2022 15:59:05 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F6E8798C0;
 Mon, 31 Jan 2022 15:58:34 +0000 (UTC)
Date: Mon, 31 Jan 2022 16:58:31 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] docs: expand firmware descriptor to allow flash
 without NVRAM
Message-ID: <YfgHJ7w+Vo43a2qO@paraplu>
References: <20220131125509.170307-1-berrange@redhat.com>
 <YffrgRRVCEWVLS41@paraplu> <Yffz/v/7b6jJOBwi@redhat.com>
 <Yff+gCndUlijqMsz@paraplu> <YfgBpsEKl5ArM+64@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YfgBpsEKl5ArM+64@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 03:35:02PM +0000, Daniel P. Berrangé wrote:
> On Mon, Jan 31, 2022 at 04:21:36PM +0100, Kashyap Chamarthy wrote:
> > On Mon, Jan 31, 2022 at 02:36:46PM +0000, Daniel P. Berrangé wrote:

[...]

> > > The firmware can be provided in qcow2 format too, so if really
> > > concerned, just create a qcow2 file with a backing store pointing
> > > to the readonly master, so you're only paying the price of the
> > > delta for any guest VARs writes. That's more efficient than what
> > > we do today with copying the separate raw format VARS.fd file.
> > 
> > That's nice, I didn't know the qcow2 possibility in this context.  For
> > some reason I assumed the file format always has to be raw here.  Your
> > qcow2 point above should  be documented, if it isn't already.  Although
> > I don't know the right place for it.
> 
> There's already a format field in the descriptor, but even if the
> firmware is distributed as raw, libvirt can choose to put qcow2
> overlay on it, as its all configured with -blockdev

Ah, understood.  

I should've first checked the spec to look for the @format field.  For
others reading the thread, the @format bit is located here
infirmware.json:

  [...]
  # @FirmwareFlashFile:
  #
  # Defines common properties that are necessary for loading a firmware
  # file into a pflash chip. The corresponding QEMU command line option is
  # "-drive file=@filename,format=@format". Note however that the
  # option-argument shown here is incomplete; it is completed under
  # @FirmwareMappingFlash.
  #
  # @filename: Specifies the filename on the host filesystem where the
  #            firmware file can be found.
  #
  # @format: Specifies the block format of the file pointed-to by
  #          @filename, such as @raw or @qcow2.
  [...]

-- 
/kashyap


