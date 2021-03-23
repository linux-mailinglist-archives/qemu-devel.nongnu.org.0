Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7E3460DF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:02:52 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhcR-0003GE-Rk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOhVu-0003yl-RD
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:56:06 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:17133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOhVt-0006De-1b
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1616507764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AKQrCAQcWdsa+Byn4P8zJG4SbjkrIFmsSJjZbt4DS4Q=;
 b=G5/D6nDuGGqxRGSZCYhV7EOZT7L6YaIULmHlHft3E6f7QXTkYlwdjzpq
 bp6fAf7RSU9eEgrtQQ9VNnIkLDdWuautPamc1CZXSjMGbXwONVx0JKXpW
 WjZq8xviyHze2HzdgXaM/oZjSYrJszdZ4n8hfZLV0ItyEt+cQZQyH7JZp 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vEClJmEBD4Y4MMdqAOEMl/0pJp187SyXgfb9AsFnZDxXszuegBu2e5xYCPy32s50rrDAftsuLa
 HfLsXYq1BohkG4F7a7n4pjcRLeVye39KlL4194ZPmnevkNHAWRiHC8wSquMC1os51EQ6ZglUNu
 o5TWy//ANAhwtQavxyT0Byjcj7RFJnLc24kXW1lY9+sXV3rRt8RC1x08eYsy2/ns3RyPly2VX/
 7LUG6CaSI6ls3yarKehhMNsYYiSg95veGANWF7U/xDZM5p7rN9NUj28AE6mzNC9rCYG723qAzR
 jws=
X-SBRS: 5.1
X-MesageID: 39903702
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:irZnRK6CO4ydj/30rAPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbcRHW3tV2kZ
 1te60WMrbNJHBxh8ri/U2cG9Ev3NGI/MmT9J/j5l1GJDsLV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsnfZvjTymZHgRc4CHFmAINtKz6uHjuZr6bXc9dnoawSaUizfA0tDHOjiemiwTSjZehYolmF
 K16jDRwoWGn7WFxgTH12nVhq4m1OfJ7tdYHsSDhow0B1zX+2GVTb9sUbGDozw5ydvHgDpErP
 D2rxgtJMh14X/KF1vFxyfF4RXq0zol9hbZuDylqEbjusDwSXYbDMdMlOtiA37kwncgp9113e
 Z32XuYvfNsfHH9tRn6juKoazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPT8ukcYa
 dTJfCZwMwTXUKRbnjfsGUq6serRG4PEhCPRVVHktCJ0gJRgGtywyIjtY0it0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEZserFGrXQ1bpPHiJKVrqUIELUki966Lf0fEQ3qWHaZYIxJw9lN
 DqS1VDr1M/fEroFImAx5tO/hfRQHisXDjkx81EjqIJ+IHUdf7OC2muWVoum8yvr7E0GcvAQc
 u+P5pQHrviIALVaMN09jy7f6MXBWgVUcUTtNp+cUmJuNj3JorjsfGedP7SIbHqACs1Q2+XOA
 pGYBHDYOF7qmy7UH7xhxbcH1n3fFbkwJ52GK/Gu+4JyIYMMYVIuhMPiUuw49yKLTEqiN10QG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F29RqRQSKEPye7Ybs9CZcWRftUH3YSNXfofzKk
 pytl538aW4I9is3igkEcugKX/fpWAUvmi2Q5AVnbCj6c/pdogjNIsvXLV8GGzwZlpIsDcvjF
 0GSQcfAmfDCzvliMye/eYpLdCaU+M5vSCGDop/r2nFuUCVuMc1L0FrIgKGYIqwmgYhRz1dm1
 tr1bQQ6YDw1gqHIXcjgeg+LV1HYHmWBrUDFwieeIBIgNnQCX5NZGORhSWtjhk5dm/xnn9i+l
 DJPGmaf+rGDUFavW0d2qH28ElsfmHYZE5obGtm2LcNXljuqzJ20eWRYLC03HbUYlwewvsFOD
 WtW0paHip+g9S23gWSgjCMCDEvwYgvJPXUCPAmf6vI0n2gbI2OmqduJY4dwL91cNTvuPQMS+
 SRZkucKy75Efog30iNvWk+URME3UUMgLftwlno/WK41HkwDb7bJ0lnXagSJ5WZ43L/T/iF3Z
 1lhbsOzKGNG3S0bsTDxbDcbjZFJB+Wu2KwQu0yoZ1fvK45ttJIbu/meCqN0GsC0AQ1Lc/ymk
 9bXb9y56rZPJRzO8MVYCBU8zMS5aayBVputhazBOAwfVsg1SCGe9yI5qfFsropDAmKohDqNV
 yW7i1a+LPEUkK4pM4nIrN1JX4Tbk42rGlm9qeFcYbbDQ2xbeFN/FagKBaGAchgYbnAHa9Vtw
 pw5tGDgvSeeCX50h3BpDcTGNM+z0+3BcepRB+WEeFG89amKU2Bj6uj7sm0lir2Q1KAGjclrJ
 wAc1cRYMRFgiQji4Ny0jHacN2Inms110ZT5jZukUOF4PnT3Fvm
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; d="scan'208";a="39903702"
Date: Tue, 23 Mar 2021 13:56:00 +0000
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>
Subject: Re: [PULL 0/1] xen queue 2021-03-23
Message-ID: <YFnzcAVsK0x9GDmC@perard>
References: <20210323120439.563855-1-anthony.perard@citrix.com>
 <161650138433.9581.1964473934310510991@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <161650138433.9581.1964473934310510991@72b6d80f974b>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Tue, Mar 23, 2021 at 05:09:45AM -0700, no-reply@patchew.org wrote:
> ERROR: Author email address is mangled by the mailing list
> #2: 
> Author: Anthony PERARD via <qemu-devel@nongnu.org>

The actual commit in the pull request is fine.

I didn't work around the email issue when sending pull request, but I've
worked around it when sending patch series.

Cheers,

-- 
Anthony PERARD

