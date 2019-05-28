Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BD2D165
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 00:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVkOO-0001JE-B4
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 18:16:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1hVkMy-0000vN-Hx
	for qemu-devel@nongnu.org; Tue, 28 May 2019 18:14:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1hVkMx-0003pL-LG
	for qemu-devel@nongnu.org; Tue, 28 May 2019 18:14:56 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18289)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1hVkMx-0003lx-Bx
	for qemu-devel@nongnu.org; Tue, 28 May 2019 18:14:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id CCB777462B8;
	Wed, 29 May 2019 00:14:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 22C107456B4; Wed, 29 May 2019 00:14:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 1946974569A;
	Wed, 29 May 2019 00:14:31 +0200 (CEST)
Date: Wed, 29 May 2019 00:14:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87lfyqla7r.fsf@dusky.pond.sub.org>
Message-ID: <alpine.BSF.2.21.9999.1905290013020.20265@zero.eik.bme.hu>
References: <87lfyqla7r.fsf@dusky.pond.sub.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-devel] Headers without multiple inclusion guards
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	=?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Eric Auger <eric.auger@redhat.com>, Paul Durrant <paul.durrant@citrix.com>,
	Stafford Horne <shorne@gmail.com>,
	=?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Claudio Fontana <claudio.fontana@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 May 2019, Markus Armbruster wrote:
> sam460ex
> M: BALATON Zoltan <balaton@eik.bme.hu>
> hw/display/sm501_template.h

This is like other *_template.h files mentioned by Peter in his reply and 
is intended to be included multiple times.

Regards,
BALATON Zoltan

