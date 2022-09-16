Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6777F5BAE63
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 15:41:28 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZBax-0005UE-AQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 09:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bagasdotme@gmail.com>)
 id 1oZ7Tz-0006L4-Ed
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:17:59 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bagasdotme@gmail.com>)
 id 1oZ7Tu-00053V-9q
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:17:56 -0400
Received: by mail-pg1-x534.google.com with SMTP id t65so19821805pgt.2
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 02:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=RFJvLC3oyKntFrzTiQRhGZVyVO6GPmrCQg8gZcgZyFw=;
 b=Si6vfDs3bb2P2LS+f46ihWdK3HAyZdel6Ti1Rl2uXqTyVhhM+fRPVv2zmQ4d/VKab8
 E4MWbu0mTcGqAAdPVQlX+SSKfU7KNUsJrnxmoBrVPgeHoXCdIBpGm9c0rMYAv+TCkITP
 CrEQiNGzUycaWOLkBp7E1yPKzvFAgYuY/fZAO8XH1XVhBx+LMLqnJpoTapoE/PeMwBdh
 gR1mmMH6iNh/WBmaizEX2KFNP64aO1OPWnEsFQYWCLpTltBTj52KfzB4SBNaMVGNxlZc
 4uKj2M4qd/vGEsuKn8Qx6qonwZz8cdIn9MQSREeaVvRUXI8uhZafFWRTbUHEkdBASLVc
 boHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=RFJvLC3oyKntFrzTiQRhGZVyVO6GPmrCQg8gZcgZyFw=;
 b=Qkz762rxdjNSFRkBVVtlxp+YUFrpW1YDzIboHMeoK9e9K8g4pMbfQwAw9vLMpSWfVO
 npqThpBOpiEW8Xy/MTHbkpIdPEG7GVLn4SBPHycKgqZLlEZzPu5csb3kS3JQaVbln0T2
 lRsgpDokUZJgyN0UrJH7twHl9JICBwnPvyU1F9PFTynGH9RZoYvQcp/2qb+8fjTvSr5E
 BC3lirNg3MoJWA+CqBseQ6uabAIpujE8avz/3w3RTshw0GukkMv+kA1p+OKRPxTx6sXY
 F39QgoiiH/o9PP4ar8MN9nq7bYrHo1W+wF+byzoOwIK6tjGnoLxYREY0uRaaPA2Er9Fp
 f4/g==
X-Gm-Message-State: ACrzQf1irFH7Tw/m1wbqwinxolT8nyuE0du1vRQbFpZKnO7c7i5B+rda
 G39zE5eTTW05GPaLU7VL0sI=
X-Google-Smtp-Source: AMsMyM6PMf1pTSKPrEToM1vu4+OPBqOTXE35gLiVtkoVeVNAu/wJ9Awn1DLWt6lUQ0y1S1KgHHMDJw==
X-Received: by 2002:a63:77c4:0:b0:435:4224:98b6 with SMTP id
 s187-20020a6377c4000000b00435422498b6mr3751652pgc.94.1663319871288; 
 Fri, 16 Sep 2022 02:17:51 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-32.three.co.id. [116.206.28.32])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b00174f7d10a03sm14635852plh.86.2022.09.16.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 02:17:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 5800510322A; Fri, 16 Sep 2022 16:17:48 +0700 (WIB)
Date: Fri, 16 Sep 2022 16:17:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <YyQ/PHZHkDSgjH/v@debian.me>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-4-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y7c2sZGFbG3OyuxM"
Content-Disposition: inline
In-Reply-To: <20220915142913.2213336-4-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bagasdotme@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 16 Sep 2022 09:35:54 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--y7c2sZGFbG3OyuxM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 10:29:08PM +0800, Chao Peng wrote:
> + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
> +   private memory access when the bit is set otherwise the memory error =
is
> +   caused by shared memory access when the bit is clear.

s/set otherwise/set. Otherwise,

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--y7c2sZGFbG3OyuxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCYyQ/PAAKCRD2uYlJVVFO
o+4BAQDezOCiD0NOTihbyDi8bMxnDsZat5ohcP3Z6qp+0VEjSAD+PZb6ujbn8gYi
c4AOBSOQzNSdKZVaTt8s86rxM84+4gk=
=Ns2r
-----END PGP SIGNATURE-----

--y7c2sZGFbG3OyuxM--

