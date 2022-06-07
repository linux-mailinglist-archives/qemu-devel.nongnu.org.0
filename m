Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E26353FB3F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:30:33 +0200 (CEST)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWTo-0003Lz-0J
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyVvn-0008T8-SI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyVvj-0003p9-PC
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654595718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gq5/H0xkgpSldEk5Z0wIV6NF7QnQEC2F/6U4QRimfFA=;
 b=G0x0ayf/827IrfVRgjqN1E6dky4HJD5h88+S/dposfU41U7BZ8Y9X7ZXhNYKvyQSrLDX/d
 3jQ7LuIOJoRnkwYeKXL0IlAD7Fc/ciiapeXlXpd65b3aygxC1fbzjfIIi4RqgD3L21aAx6
 eZqk8gbJ2oz7sBOMfwecmOBVuyW2kR0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-_4MA7eZ2NImfYcWEbjOyDA-1; Tue, 07 Jun 2022 05:55:17 -0400
X-MC-Unique: _4MA7eZ2NImfYcWEbjOyDA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y13-20020a056402358d00b0042dfb820070so12081414edc.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gq5/H0xkgpSldEk5Z0wIV6NF7QnQEC2F/6U4QRimfFA=;
 b=eReQnnQcC4V1rw+M8TtE6x/oxzDkAGwPUyYY2W4yvU3IvlOBEfbVsWp9CqdeSe35Uv
 vDiJRF0t9zNWFZ3aohNsrjGTYypZomt/dBHVMT4eX5rQl3qB4Un2lXYF0Ib9y7PSUKmk
 XEkAE/8hJgaF4LVpQAOmcplck45XxACZ2fjjZszcL+Y/lGuNC0C6nVSNWlT04Wk4GOSs
 9uiW666rmXpKYPnqr4pR8CgtdivEfR1ZYi8xaweBiRJQrjZC8MvoNWbYyH2tJ1Nz5TLW
 m6YUjQ349n0qEvgyHKg4/uwLnzno1NozQQdUjQnRs4T1T9EHrfnr7RxdigjGczIw+YpD
 YkCw==
X-Gm-Message-State: AOAM533lk/7+FWDPEvuoeP92kMDfn/p+whXQpUWctWy0/4J8fc0FziKk
 DVuNzKTnhHTsKEbP9pPKI81/0R318kBW+DuEHKFwmlwd1q4VMAkkm8SNVXaaPgTQF1RCm5GrSz3
 Mw/oV6MHrml6671g=
X-Received: by 2002:a05:6402:51d4:b0:42f:b38d:dbb9 with SMTP id
 r20-20020a05640251d400b0042fb38ddbb9mr21067359edd.255.1654595716478; 
 Tue, 07 Jun 2022 02:55:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZv5hUtHXQy4j9gNRNMY8Y/umrgIo9c8YtWvBOhT6wmBIWd5KSRc5fZVDOBMFDjzTS6wuz4g==
X-Received: by 2002:a05:6402:51d4:b0:42f:b38d:dbb9 with SMTP id
 r20-20020a05640251d400b0042fb38ddbb9mr21067341edd.255.1654595716201; 
 Tue, 07 Jun 2022 02:55:16 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a1709062d5200b006f3ef214da6sm7450708eji.12.2022.06.07.02.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:55:15 -0700 (PDT)
Date: Tue, 7 Jun 2022 11:55:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 2/5] bios-tables-test: teach test to use smbios 3.0 tables
Message-ID: <20220607115514.4b9bd0b9@redhat.com>
In-Reply-To: <CAMDeoFXP=wtarQdjFs3i_aDVgKGegAa=ho09v_DWG9xnLcOSNg@mail.gmail.com>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-3-jusual@redhat.com>
 <20220602170405.29ec7149@redhat.com>
 <CAMDeoFXP=wtarQdjFs3i_aDVgKGegAa=ho09v_DWG9xnLcOSNg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Jun 2022 12:52:00 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> On Thu, Jun 2, 2022 at 5:04 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Fri, 27 May 2022 18:56:48 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >  
> > > Introduce the 64-bit entry point. Since we no longer have a total
> > > number of structures, stop checking for the new ones at the EOF
> > > structure (type 127).
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test.c | 101 ++++++++++++++++++++++++---------
> > >  1 file changed, 75 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index a4a46e97f0..0ba9d749a5 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -75,6 +75,14 @@
> > >  #define OEM_TEST_ARGS      "-machine x-oem-id=" OEM_ID ",x-oem-table-id=" \
> > >                             OEM_TABLE_ID
> > >
> > > +#define SMBIOS_VER21 0
> > > +#define SMBIOS_VER30 1
> > > +
> > > +typedef struct {
> > > +    struct smbios_21_entry_point ep21;
> > > +    struct smbios_30_entry_point ep30;
> > > +} smbios_entry_point;
> > > +
> > >  typedef struct {
> > >      bool tcg_only;
> > >      const char *machine;
> > > @@ -88,8 +96,8 @@ typedef struct {
> > >      uint64_t rsdp_addr;
> > >      uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> > >      GArray *tables;
> > > -    uint32_t smbios_ep_addr;
> > > -    struct smbios_21_entry_point smbios_ep_table;
> > > +    uint64_t smbios_ep_addr[2];
> > > +    smbios_entry_point smbios_ep_table;
> > >      uint16_t smbios_cpu_max_speed;
> > >      uint16_t smbios_cpu_curr_speed;
> > >      uint8_t *required_struct_types;
> > > @@ -533,10 +541,10 @@ static void test_acpi_asl(test_data *data)
> > >      free_test_data(&exp_data);
> > >  }
> > >
> > > -static bool smbios_ep_table_ok(test_data *data)
> > > +static bool smbios_ep2_table_ok(test_data *data)
> > >  {
> > > -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> > > -    uint32_t addr = data->smbios_ep_addr;
> > > +    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table.ep21;
> > > +    uint32_t addr = data->smbios_ep_addr[SMBIOS_VER21];
> > >
> > >      qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
> > >      if (memcmp(ep_table->anchor_string, "_SM_", 4)) {
> > > @@ -559,29 +567,59 @@ static bool smbios_ep_table_ok(test_data *data)
> > >      return true;
> > >  }
> > >
> > > -static void test_smbios_entry_point(test_data *data)
> > > +static bool smbios_ep3_table_ok(test_data *data)
> > > +{
> > > +    struct smbios_30_entry_point *ep_table = &data->smbios_ep_table.ep30;
> > > +    uint64_t addr = data->smbios_ep_addr[SMBIOS_VER30];
> > > +
> > > +    qtest_memread(data->qts, addr, ep_table, sizeof(*ep_table));
> > > +    if (memcmp(ep_table->anchor_string, "_SM3_", 5)) {
> > > +        return false;
> > > +    }
> > > +
> > > +    if (acpi_calc_checksum((uint8_t *)ep_table, sizeof *ep_table)) {
> > > +        return false;
> > > +    }
> > > +
> > > +    return true;
> > > +}
> > > +
> > > +static int test_smbios_entry_point(test_data *data)
> > >  {
> > >      uint32_t off;
> > > +    bool found_ep2 = false, found_ep3 = false;
> > >
> > >      /* find smbios entry point structure */
> > >      for (off = 0xf0000; off < 0x100000; off += 0x10) {
> > > -        uint8_t sig[] = "_SM_";
> > > +        uint8_t sig[] = "_SM3_";  
> >
> > well I'd just add a separate sig3  
> 
> Ok
> 
> > >          int i;
> > >
> > >          for (i = 0; i < sizeof sig - 1; ++i) {
> > >              sig[i] = qtest_readb(data->qts, off + i);
> > >          }
> > >
> > > -        if (!memcmp(sig, "_SM_", sizeof sig)) {
> > > +        if (!found_ep2 && !memcmp(sig, "_SM_", sizeof sig - 2)) {  
> >
> > keep original v2 code and just add similar chunk for v3,
> > drop found_foo locals,
> > that should make it easier to read/follow
> > (i.e. less conditions to think about and no magic fiddling with the length of signature)  
> 
> The idea was to reuse existing code, but since it doesn't improve
> things much, it makes sense to repeat it.
> 
> > >              /* signature match, but is this a valid entry point? */
> > > -            data->smbios_ep_addr = off;
> > > -            if (smbios_ep_table_ok(data)) {
> > > -                break;
> > > +            data->smbios_ep_addr[SMBIOS_VER21] = off;
> > > +            if (smbios_ep2_table_ok(data)) {
> > > +                found_ep2 = true;
> > > +            }
> > > +        } else if (!found_ep3 && !memcmp(sig, "_SM3_", sizeof sig - 1)) {
> > > +            data->smbios_ep_addr[SMBIOS_VER30] = off;
> > > +            if (smbios_ep3_table_ok(data)) {
> > > +                found_ep3 = true;
> > >              }
> > >          }
> > > +
> > > +        if (found_ep2 || found_ep3) {
> > > +            break;
> > > +        }
> > >      }
> > >
> > > -    g_assert_cmphex(off, <, 0x100000);
> > > +    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER21], <, 0x100000);
> > > +    g_assert_cmphex(data->smbios_ep_addr[SMBIOS_VER30], <, 0x100000);
> > > +
> > > +    return found_ep3 ? SMBIOS_VER30 : SMBIOS_VER21;  
> >
> > and use content of data->smbios_ep_addr[] to return found version  
> 
> You mean check if it's initialized?

yep, it's zeroed out initially and you can check if it's set to something else
after detection phase


> 
> > >  }
> > >
> > >  static inline bool smbios_single_instance(uint8_t type)
> > > @@ -625,16 +663,23 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > >      return true;
> > >  }
> > >
> > > -static void test_smbios_structs(test_data *data)
> > > +static void test_smbios_structs(test_data *data, int ver)
> > >  {
> > >      DECLARE_BITMAP(struct_bitmap, SMBIOS_MAX_TYPE+1) = { 0 };
> > > -    struct smbios_21_entry_point *ep_table = &data->smbios_ep_table;
> > > -    uint32_t addr = le32_to_cpu(ep_table->structure_table_address);
> > > -    int i, len, max_len = 0;
> > > +
> > > +    smbios_entry_point *ep_table = &data->smbios_ep_table;
> > > +    int i = 0, len, max_len = 0;
> > >      uint8_t type, prv, crt;
> > > +    uint64_t addr;
> > > +
> > > +    if (ver == SMBIOS_VER21) {
> > > +        addr = le32_to_cpu(ep_table->ep21.structure_table_address);
> > > +    } else {
> > > +        addr = le64_to_cpu(ep_table->ep30.structure_table_address);
> > > +    }
> > >
> > >      /* walk the smbios tables */
> > > -    for (i = 0; i < le16_to_cpu(ep_table->number_of_structures); i++) {
> > > +    do {
> > >
> > >          /* grab type and formatted area length from struct header */
> > >          type = qtest_readb(data->qts, addr);
> > > @@ -660,19 +705,23 @@ static void test_smbios_structs(test_data *data)
> > >          }
> > >
> > >          /* keep track of max. struct size */
> > > -        if (max_len < len) {
> > > +        if (ver == SMBIOS_VER21 && max_len < len) {
> > >              max_len = len;
> > > -            g_assert_cmpuint(max_len, <=, ep_table->max_structure_size);
> > > +            g_assert_cmpuint(max_len, <=, ep_table->ep21.max_structure_size);
> > >          }
> > >
> > >          /* start of next structure */
> > >          addr += len;
> > > -    }
> > >
> > > -    /* total table length and max struct size must match entry point values */
> > > -    g_assert_cmpuint(le16_to_cpu(ep_table->structure_table_length), ==,
> > > -                     addr - le32_to_cpu(ep_table->structure_table_address));
> > > -    g_assert_cmpuint(le16_to_cpu(ep_table->max_structure_size), ==, max_len);
> > > +    } while (ver == SMBIOS_VER21 ?
> > > +                (++i < le16_to_cpu(ep_table->ep21.number_of_structures)) : (type != 127));
> > > +
> > > +    if (ver == SMBIOS_VER21) {
> > > +        /* total table length and max struct size must match entry point values */
> > > +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.structure_table_length), ==,
> > > +                         addr - le32_to_cpu(ep_table->ep21.structure_table_address));
> > > +        g_assert_cmpuint(le16_to_cpu(ep_table->ep21.max_structure_size), ==, max_len);
> > > +    }
> > >
> > >      /* required struct types must all be present */
> > >      for (i = 0; i < data->required_struct_types_len; i++) {
> > > @@ -756,8 +805,8 @@ static void test_acpi_one(const char *params, test_data *data)
> > >       * https://bugs.launchpad.net/qemu/+bug/1821884
> > >       */
> > >      if (!use_uefi) {
> > > -        test_smbios_entry_point(data);
> > > -        test_smbios_structs(data);
> > > +        int ver = test_smbios_entry_point(data);
> > > +        test_smbios_structs(data, ver);
> > >      }
> > >
> > >      qtest_quit(data->qts);  
> >  
> 


