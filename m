Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890669E361
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUZc-0001BI-CJ; Tue, 21 Feb 2023 10:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUUZY-0001A8-AG; Tue, 21 Feb 2023 10:28:52 -0500
Received: from lounge.grep.be ([2a01:4f8:200:91e8::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w@uter.be>)
 id 1pUUZV-00008R-Iv; Tue, 21 Feb 2023 10:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
 s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wpU4GWnGunuQpvZMVNVvPLhBK22cJPRxRC4WXwip7Y4=; b=Y5QyGPrIpSlTmr9ImPHsfiFNcJ
 toQMcomrj05elgb2HjzzbIrDQRgJ8AY5yjaBu2zuW0vCPcaZ29SW3siDurWHVp/bM37y/Hi6Ig/xO
 cu897KiTl5p66iG0yoWVpkzc2qRRwZ0GT7XNMfEXs7myHQJY2CoJXSEzGpgJ63O5P1Z2zEHUREEN6
 5eIZvzbarL3wGxTENCiT+7i8P6DI1muFa2X5pyPlrVPXvndNfxhl/GTTw5FWzcVH6R0d1b4/iBxGv
 7jsguIani6pv4DCTKdlzssv0RSt74cZH1lwvMhPr33asGNXAoTXAfMFRxvciKAs7zemAoSmHinpMY
 //Mu1A7w==;
Received: from [196.251.239.242] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <w@uter.be>)
 id 1pUUSh-00H19U-Th; Tue, 21 Feb 2023 16:21:48 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
 (envelope-from <w@uter.be>) id 1pUUSX-000L4w-1P;
 Tue, 21 Feb 2023 17:21:37 +0200
Date: Tue, 21 Feb 2023 17:21:37 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 2/6] spec: Tweak description of maximum block size
Message-ID: <Y/ThgdLldvb5rpwA@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-3-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114224655.2186173-3-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
Received-SPF: pass client-ip=2a01:4f8:200:91e8::2; envelope-from=w@uter.be;
 helo=lounge.grep.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Eric,

Busy days, busy times. Sorry about the insane delays here.

On Mon, Nov 14, 2022 at 04:46:51PM -0600, Eric Blake wrote:
> Commit 9f30fedb improved the spec to allow non-payload requests that
> exceed any advertised maximum block size.  Take this one step further
> by permitting the server to use NBD_EOVERFLOW as a hint to the client
> when a request is oversize (while permitting NBD_EINVAL for
> back-compat), and by rewording the text to explicitly call out that
> what is being advertised is the maximum payload length, not maximum
> block size.  This becomes more important when we add 64-bit
> extensions, where it becomes possible to extend `NBD_CMD_BLOCK_STATUS`
> to have both an effect length (how much of the image does the client
> want status on - may be larger than 32 bits) and an optional payload
> length (a way to filter the response to a subset of negotiated
> metadata contexts).  In the shorter term, it means that a server may
> (but not must) accept a read request larger than the maximum block
> size if it can use structured replies to keep each chunk of the
> response under the maximum payload limits.
> ---
>  doc/proto.md | 127 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 73 insertions(+), 54 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 8f08583..53c334a 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -745,8 +745,8 @@ text unless the client insists on TLS.
> 
>  During transmission phase, several operations are constrained by the
>  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> -as well as by three block size constraints defined here (minimum,
> -preferred, and maximum).
> +as well as by three block size constraints defined here (minimum
> +block, preferred block, and maximum payload).
> 
>  If a client can honour server block size constraints (as set out below
>  and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
> @@ -772,15 +772,15 @@ learn the server's constraints without committing to them.
> 
>  If block size constraints have not been advertised or agreed on
>  externally, then a server SHOULD support a default minimum block size
> -of 1, a preferred block size of 2^12 (4,096), and a maximum block size
> -that is effectively unlimited (0xffffffff, or the export size if that
> -is smaller), while a client desiring maximum interoperability SHOULD
> -constrain its requests to a minimum block size of 2^9 (512), and limit
> -`NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
> -2^25 (33,554,432).  A server that wants to enforce block sizes other
> -than the defaults specified here MAY refuse to go into transmission
> -phase with a client that uses `NBD_OPT_EXPORT_NAME` (via a hard
> -disconnect) or which uses `NBD_OPT_GO` without requesting
> +of 1, a preferred block size of 2^12 (4,096), and a maximum block
> +payload size that is at least 2^25 (33,554,432) (even if the export
> +size is smaller); while a client desiring maximum interoperability
> +SHOULD constrain its requests to a minimum block size of 2^9 (512),
> +and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
> +block size of 2^25 (33,554,432).  A server that wants to enforce block
> +sizes other than the defaults specified here MAY refuse to go into
> +transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
> +a hard disconnect) or which uses `NBD_OPT_GO` without requesting

This does more than what the commit message says: it also limits payload
size from 0xffffffff to 2^25. We already have a "A server that desires
maximum interoperability" clause that mentions the 2^25, so I'm not
entirely sure why we need to restrict that for the default cause.

Remember, apart from specifying how something should be implemented, the
spec also documents current and historic behavior. I am probably
convinced that it makes more sense to steer people towards limiting to
2^25, but it should be done in such a way that servers which accept a
0xffffffff block size are not suddenly noncompliant. I don't think this
does that.

[no further comments on this one]
-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

